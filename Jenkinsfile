pipeline {
    agent any
    stages {
	stage('Build') {
	    steps {
		catchError {
		    copyArtifacts(projectName: "${env.BRANCH_NAME}", selector: lastCompleted())
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
    }
    post {
	always {
	    cleanWs deleteDirs: true, patterns: [[pattern: 'src/test/', type: 'INCLUDE']]
	}
    }
}

void prepareImport() {
    def files = findFiles(glob: "src/test/**/*.oml")
    def stages = [:]
    files.each { file ->
	// Wrapper required to run parallel under script
	String name = file.name.toString().split('\\.')[0]
	String path = file.path.toString()
	stages.put(name, create_import_stage(name, path))
    }
    script {
	try {
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
		    echo("Locked resource: ${env.LOCK}")
		    sh '''p="target/scala-2.12/actport-assembly-0.1-SNAPSHOT.jar"

$MATLAB -nodesktop -nosplash -batch "javaaddpath(\'$p\'), cd \'src/main/matlab\', import_activate_oml(\'$MODEL\', \'$WORKSPACE/src/test\');"
'''
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
	stages.put(name, create_slx_stage(name, path))
    }
    script {
	try{
	    parallel(stages)
	} catch (e) {
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
		    echo("Locked resource: ${env.LOCK}")
		    sh '''
$MATLAB -nodesktop -nosplash -batch "sim(\'$MODEL\');"
'''
		}
	    }
	}
    }
}
