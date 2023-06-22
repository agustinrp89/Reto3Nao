pipeline {
  agent any
  
  stages {
    stage('Clone repository') {
      steps {
        git 'https://github.com/PabelH/react-testing.git'
      }
    }
    stage('Install dep') {
      steps {
        
          sh 'npm install'
          
          //sh 'yarn test'
        
      }
    }
  stage('Testing') {
      steps {
    
        //  sh 'yarn test'
          sh 'npm run test'
        
      }
    }
  stage('Build and push Docker image') {
      steps {
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: '6c01fe77-15fd-4e65-865d-2fc6ba08ac47',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
          ]]) {
            sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 713860279714.dkr.ecr.us-east-2.amazonaws.com'
            sh 'docker build -t radionet .'
            sh 'docker tag radionet:latest 713860279714.dkr.ecr.us-east-2.amazonaws.com/radionet:latest'
            sh 'docker push 713860279714.dkr.ecr.us-east-2.amazonaws.com/radionet:latest'
          }
        }
      }
    }  
  }
