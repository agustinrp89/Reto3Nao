pipeline {
  agent any
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Clone repository') {
      steps {
        git 'https://github.com/agustinrp89/Reto3Nao.git'
      }
    }
    stage('Install dep') {
      steps {
        
          bat 'npm install'
          
          //sh 'yarn test'
        
      }
    }
  stage('Testing') {
      steps {
    
        //  sh 'yarn test'
          bat 'npm run test'
        
      }
    }
  stages {
    stage('Build') {
      steps {
        bat 'docker build -t agustinmdp89/jenkins-docker-hub .'
      }
    }
    stage('Login') {
      steps {
        bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        bat 'docker push agustinmdp89/jenkins-docker-hub'
      }
    }
  }
    }  
  }
