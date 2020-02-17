pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
          sh 'tox'
      }
    }
    stage('Static Analysis') {
      steps {
          sh 'pylint src/pyjen/*.py tests/*.py'
      }
    }
  }
}
