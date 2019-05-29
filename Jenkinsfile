import groovy.transform.Field

@Field List simFailed = []
@Field List importFailed = []

pipeline {
    agent any
    stages {
	stage('Build') {
	    steps {
		catchError {
		    copyArtifacts(projectName: "${env.BRANCH_NAME}",
				  selector: lastCompleted(),
				  excludes: "target/*.zip")
		}
		sh '/usr/bin/sbt assembly'
		archiveArtifacts(artifacts: 'target/**', allowEmptyArchive: true)
	    }
	}
	stage('import OML') {
	    environment {
		LD_LIBRARY_PATH = '/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/sys/os/glnxa64'
		PATH = '/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/bin:/usr/local/MATLAB/R2019a/sys/os/glnxa64:/lib64:/sbin:/usr/sbin:/bin:/usr/bin'
		MATLAB = '/usr/local/MATLAB/R2019a/bin/matlab'
	    }
	    steps {
		prepareImport()
	    }
	}
	stage('Simulate simulink') {
	    environment {
		LD_LIBRARY_PATH = '/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/sys/os/glnxa64'
		PATH = '/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/bin:/usr/local/MATLAB/R2019a/sys/os/glnxa64:/lib64:/sbin:/usr/sbin:/bin:/usr/bin'
		MATLAB = '/usr/local/MATLAB/R2019a/bin/matlab'
	    }
	    steps {
		prepareSim()
	    }
	}
	stage('Deploy') {
	    environment {
		GITHUB_TOKEN = credentials('aebcf262-4e35-4e35-a334-6272504480cb')
		RELEASE = "target/actport-${TAG_NAME}.zip"
	    }
	    when {
		buildingTag()
	    }
	    steps {
		zip(zipFile: "$RELEASE", archive: true,
		    dir: "${env.WORKSPACE}",
		    glob: 'target/scala*/*.jar, src/main/matlab/**')
		echo "Publishing release on GitHub"
		sh '''
# Get the full message associated with this tag
message="$(git for-each-ref refs/tags/$TAG_NAME --format='%(contents)')"

# Get the title and the description as separated variables
name=$(echo "$message" | head -n1)
description=$(echo "$message" | tail -n +3)
description=$(echo "$description" | sed ':a;N;$!ba;s/\\n/\\\\n/g') # Escape line breaks to prevent json parsing problems

# Create release
release_token=$(curl -H "Authorization:token $GITHUB_TOKEN" --data \\
"{\\"tag_name\\": \\"$TAG_NAME\\", \\
\\"name\\": \\"$name\\", \\
\\"body\\": \\"$description\\", \\
\\"draft\\": true, \\
\\"prerelease\\": false}" \\
 https://api.github.com/repos/combine-control-systems-ab/actport/releases)

# Extract upload_url from release token
upload_url=$(echo "$release_token" | jq -r ".upload_url" | cut -d"{" -f1)

# Upload artifact
curl -XPOST -H "Authorization:token $GITHUB_TOKEN" \\
-H "Content-Type:application/octet-stream" \\
--data-binary @$RELEASE \\
${upload_url}?name=$(basename $RELEASE)
'''
	    }
	}
    }
    post {
	always {
	    script {
		zip(zipFile: "target/results.zip", archive: true,
		    dir: "${env.WORKSPACE}",
		    glob: 'src/test/*/actport.log, src/test/*.log')
		def String numFailSim = simFailed.size()
		def String numFailImp = importFailed.size()
		def String printSim = simFailed.join('<br>')
		def String printImp = importFailed.join('<br>')
		emailext(subject: "${env.JOB_NAME}-${env.BUILD_NUMBER}-${currentBuild.result}",
			 body: "Results from the job in the subject can be found attached<br>\
If no files attached, please check ${env.BUILD_URL}.<br>\
<br>\
Commit tested: $GIT_COMMIT<br>\
URL: https://github.com/combine-control-systems-ab/actport/commit/${GIT_COMMIT}<br>\
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
}

void prepareImport() {
    def files = findFiles(glob: "src/test/**/*.oml",
			  excludes: "**/nsolve.oml, **/car_min_time_distance_1000_batch.oml")
    def stages = [:]
    files.each { file ->
	// Wrapper required to run parallel under script
	String name = file.name.toString().split('\\.')[0]
	String path = file.path.toString()
	stages.put(name, create_import_stage(name, path))
    }
    script {
	try{
	    parallel(stages)
	} catch(e) {
	    echo(e.toString())
	}
    }
}

def create_import_stage(String fileName, String filePath) {
    return {
	// here is the trick
	stage(fileName) {
	    lock(label: "PARALLEL", quantity: 1, variable: "LOCK"){
		withEnv(["MODEL=${env.WORKSPACE}/${filePath}"]) {
		    try {
			echo("Locked resource: ${env.LOCK}")
			sh '''#!/bin/bash
p="target/scala-2.12/actport-assembly-0.1-SNAPSHOT.jar"

log=src/test/actport_$(basename "$MODEL" | cut -d. -f1).log
$MATLAB -nodesktop -nosplash -batch "javaaddpath(\'$p\'), cd \'src/main/matlab\', import_activate_oml(\'$MODEL\', \'$WORKSPACE/src/test\');" 2> >(tee --append "$log" >&2)
'''
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

void prepareSim() {
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
    script {
	try{
	    parallel(stages)
	} catch(e) {
	    echo(e.toString())
	}
    }
}

def create_slx_stage(String fileName, String filePath) {
    return {
	// here is the trick
	stage(fileName) {
	    lock(label: "PARALLEL", quantity: 1, variable: "LOCK"){
		withEnv(["MODEL=${filePath}"]) {
		    try {
			echo("Locked resource: ${env.LOCK}")
			sh '''
set -o pipefail
log=$(dirname "$MODEL")/actport.log
$MATLAB -nodesktop -nosplash -batch "sim(\'$MODEL\');" |& tee --append "$log"
set +o pipefail
'''
		    } catch(e) {
			echo("Failed simulation of model: ${fileName}")
			simFailed.add(fileName)
			throw(e)
		    }
		}
	    }
	}
    }
}
