import groovy.transform.Field
import org.jenkinsci.plugins.pipeline.modeldefinition.Utils

@Field List simFailed = []
@Field List importFailed = []

node {
    def gitVars = checkout scm
    try {
	stage('Build') {
	    try {
		copyArtifacts(projectName: "${env.BRANCH_NAME}",
			      selector: lastCompleted(),
			      excludes: "target/*.zip")
	    } catch(e) {
		echo(e.toString())
	    }
	    sh '/usr/bin/sbt assembly'
	    archiveArtifacts(artifacts: 'target/**', allowEmptyArchive: true)
	}
	stage('import OML') {
	    withEnv(['LD_LIBRARY_PATH=/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/sys/os/glnxa64',
		     'PATH=/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/bin:/usr/local/MATLAB/R2019a/sys/os/glnxa64:/lib64:/sbin:/usr/sbin:/bin:/usr/bin',
		     'MATLAB=/usr/local/MATLAB/R2019a/bin/matlab']) {
		def files = findFiles(glob: "src/test/**/*.oml",
				      excludes: "**/nsolve.oml, **/car_min_time_distance_1000_batch.oml")
		def stages = [:]
		files.each { file ->
		    // Wrapper required to run parallel under script
		    String name = file.name.toString().split('\\.')[0]
		    String path = file.path.toString()
		    stages.put(name, create_import_stage(name, path))
		}
		try{
		    parallel(stages)
		} catch(e) {
		    echo(e.toString())
		}
	    }
	}
	stage('Simulate simulink') {
	    withEnv(['LD_LIBRARY_PATH=/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/sys/os/glnxa64',
		     'PATH=/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/bin:/usr/local/MATLAB/R2019a/sys/os/glnxa64:/lib64:/sbin:/usr/sbin:/bin:/usr/bin',
		     'MATLAB=/usr/local/MATLAB/R2019a/bin/matlab']) {
		def files = findFiles(glob: "src/test/**/*.slx")
		def stages = [:]
		files.each { file ->
		    // Wrapper required to run parallel under script
		    String name = file.name.toString().split('\\.')[0]
		    String path = file.path.toString()
		    if(! importFailed.contains(name)) {
			stages.put(name, create_slx_stage(name, path))
		    }
		}
		try{
		    parallel(stages)
		} catch(e) {
		    echo(e.toString())
		}
	    }
	}
	stage('Deploy') {
	    if(env.TAG_NAME) {
		withCredentials([string(
			    credentialsId: 'aebcf262-4e35-4e35-a334-6272504480cb',
			    variable: "GITHUB_TOKEN")]) {
		    withEnv(["RELEASE=target/actport-${TAG_NAME}.zip"]){
			zip(zipFile: "$RELEASE", archive: true,
			    dir: "${env.WORKSPACE}",
			    glob: 'target/scala*/*.jar, src/main/matlab/**')
			echo "Publishing release on GitHub"
			sh "ci/deploy.sh"
		    }
		}
	    } else {
		Utils.markStageSkippedForConditional(STAGE_NAME)
	    }
	}
    } finally {
	String numFailSim = simFailed.size()
	String numFailImp = importFailed.size()
	String printSim = simFailed.join('<br>')
	String printImp = importFailed.join('<br>')
	if(numFailImp.toInteger() > 0 || numFailSim.toInteger() > 50) {
	    currentBuild.result = 'FAILURE'
	} else {
	    currentBuild.result = 'SUCCESS'
	}
	stage('Post-processing') {
	    zip(zipFile: "target/results.zip", archive: true,
		dir: "${env.WORKSPACE}",
		glob: 'src/test/*/actport.log, src/test/*.log')
	    emailext(subject: "${env.JOB_NAME}-${env.BUILD_NUMBER}-${currentBuild.result}",
		     body: "Results from the job in the subject can be found attached<br>\
If no files attached, please check ${env.BUILD_URL}.<br>\
<br>\
Commit tested: ${gitVars.GIT_COMMIT}<br>\
URL: https://github.com/combine-control-systems-ab/actport/commit/${gitVars.GIT_COMMIT}<br>\
<br>\
simFailed (${numFailSim}): ${printSim}.<br>\
importFailed (${numFailImp}): ${printImp}.",
		     from: "jenkins.actport@combine.se",
		     to: "jenkins.actport@combine.se",
		     attachmentsPattern: "target/results.zip")
	    cleanWs(deleteDirs: true,
		    patterns: [[pattern: 'src/test/', type: 'INCLUDE'],
			       [pattern: 'target/*.zip', type: 'INCLUDE']])
	}
    }
}

def create_import_stage(String fileName, String filePath) {
    return {
	stage(fileName) {
	    lock(label: "PARALLEL", quantity: 1, variable: "LOCK"){
		withEnv(["MODEL=${env.WORKSPACE}/${filePath}"]) {
		    try {
			echo("Locked resource: ${env.LOCK}")
			sh "ci/import.sh"
		    } catch(e) {
			echo("Failed import of model: ${fileName}")
			importFailed.add(fileName)
			throw(e)
		    }
		}
	    }
	}
    }
}

def create_slx_stage(String fileName, String filePath) {
    return {
	// here is the trick
	lock(label: "PARALLEL", quantity: 1, variable: "LOCK"){
	    withEnv(["MODEL=${filePath}"]) {
		try {
		    echo("Locked resource: ${env.LOCK}")
		    sh "ci/simulate.sh"
		} catch(e) {
		    echo("Failed simulation of model: ${fileName}")
		    simFailed.add(fileName)
		    throw(e)
		}
	    }
	}
    }
}
