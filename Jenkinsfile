pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Unit Tests') {
      steps {
          sh '''
            python3 -m venv .venv
            source .venv/bin/activate
            pip install -r requirements.txt
            pip install .
            pytest
          '''
      }
    }
    stage('Static Analysis') {
      steps {
          sh 'pylint src/pyjen/*.py tests/*.py'
      }
    }
  }
}
