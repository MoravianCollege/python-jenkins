pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
        sh 'echo $PATH'
        withPythonEnv('python'){
          sh 'echo $PATH'
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
