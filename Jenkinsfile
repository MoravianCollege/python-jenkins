pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
        withPythonEnv('python'){
          sh 'pip install -r requirements.txt'
          sh 'pip install .'
          sh 'pytest'
        }
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
