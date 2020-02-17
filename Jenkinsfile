pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
            sh 'pip install --user -r requirements.txt'
            sh 'pip install --user .'
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
