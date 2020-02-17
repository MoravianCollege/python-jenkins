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
          sh 'pip install -r requirements.txt'
          sh 'pip install .'
          sh 'pytest'
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
