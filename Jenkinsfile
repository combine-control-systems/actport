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
	    cleanWs(deleteDirs: true,
	    patterns: [[pattern: 'src/test/', type: 'INCLUDE'],
		       [pattern: 'target/*.zip', type: 'INCLUDE']])
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
