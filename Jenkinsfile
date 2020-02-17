pipeline {
  agent {
    docker {
      image 'python:3.8'
      args '-u jenkins:jenkins'
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
