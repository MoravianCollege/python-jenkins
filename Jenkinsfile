pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
          sh 'bash run_tests'
      }
    }
    stage('Static Analysis') {
      steps {
          sh 'pylint src/pyjen/*.py tests/*.py'
      }
    }
  }
}
