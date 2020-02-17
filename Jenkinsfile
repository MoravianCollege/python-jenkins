pipeline {
  agent {
    dockerfile {
      args '-u tester:tester'
    }
  }
  stages {
    stage('Unit Tests') {
      steps {
        withEnv(["HOME=${env.WORKSPACE}"]) {
          withPythonEnv('python') {
            sh 'pip install --user -r requirements.txt'
            sh 'pip install --user .'
            sh 'pytest'
          }
        }
      }
    }
    stage('Static Analysis') {
      steps {
          sh 'pylint src/pyjen/*.py tests/*.py'
      }
    }
  }
}
