pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '/usr/bin/sbt assembly'
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
  def files = ['median_C', 'Plane_missiles', 'Watertank', 'Discrete_Kalman_Filter',
               'discreteIntegration', 'Controller', 'median_OML', 'XFeedback']
  def stages = [:]
  files.each { file ->
    // Wrapper required to run parallel under script
    stages.put(file, createStage(file))
  }
  script {
    parallel(stages)
  }
}

def createStage(String file) {
  return {
    // here is the trick
    stage("Build stage:${file}") {
      withEnv(["MODEL=${env.WORKSPACE}/src/main/resources/examples/${file}.oml"]) {
        sh '''p="$WORKSPACE/target/scala-2.12/actport-assembly-0.1-SNAPSHOT.jar"

$MATLAB -nodesktop -nosplash -batch "javaaddpath(\'$p\'), cd \'$WORKSPACE/src/main/matlab\', import_activate_oml(\'$MODEL\');"
'''
      }
    }
  }
}
