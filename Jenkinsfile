pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
          sh 'source ./run_tests'
      }
    }
    stage('Static Analysis') {
      steps {
        withPythonEnv('python'){
          sh 'pylint src/pyjen/*.py tests/*.py'
        }
      }
    }
  }
}
