pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
        sh 'pip install -r requirements.txt --user'
        sh 'pip install -e . --user'
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
