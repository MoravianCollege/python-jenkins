pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
          sh 'tox --workdir /tmp/$(basename ${WORKSPACE})/tox-py38'
      }
    }
    stage('Static Analysis') {
      steps {
          sh 'pylint src/pyjen/*.py tests/*.py'
      }
    }
  }
}
