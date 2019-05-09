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
	// in a declarative pipeline
	stage('import OML') {
	    environment {
		LD_LIBRARY_PATH = '/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/sys/os/glnxa64'
		PATH = '/usr/local/MATLAB/R2019a/bin/glnxa64:/usr/local/MATLAB/R2019a/bin:/usr/local/MATLAB/R2019a/sys/os/glnxa64:/lib64:/sbin:/usr/sbin:/bin:/usr/bin'
		MATLAB = '/usr/local/MATLAB/R2019a/bin/matlab'
	    }
	    steps {
		prepareTests()
	    }
	}
    }
}

// at the end of the file or in a shared library
void prepareTests() {
    def files = findFiles(glob: "src/main/resources/**/*.oml")
    echo (files.toString())
    def stages = [:]
    files.each { file ->
	// Wrapper required to run parallel under script
	String name = file.name.toString()
	String path = file.path.toString()
	stages.put(name, createStage(name, path))
    }
    script {
	parallel(stages)
    }
}

def createStage(String fileName, String filePath) {
    return {
	// here is the trick
	stage(fileName) {
	    withEnv(["MODEL=${env.WORKSPACE}/${filePath}"]) {
		sh '''p="target/scala-2.12/actport-assembly-0.1-SNAPSHOT.jar"

$MATLAB -nodesktop -nosplash -batch "javaaddpath(\'$p\'), cd \'src/main/matlab\', import_activate_oml(\'$MODEL\');"
'''
	    }
	}
    }
}
