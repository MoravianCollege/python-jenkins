pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
        withPythonEnv('python'){
          sh 'pip install -r requirements.txt --user'
          sh 'pip install -e .'
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
