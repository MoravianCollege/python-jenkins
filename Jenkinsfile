pipeline {
  agent {
    dockerfile
    {
      args '-u 942:942'
    }
  }
  stages {
    stage('Unit Tests') {
      steps {
        sh 'pip install -r requirements.txt'
        sh 'pip install -e .'
        sh 'pytest'
      }
    }
    stage('Static Analysis') {
      steps {
        sh 'pylint src/pyjen/*.py tests/*.py'
      }
    }
  }
}
