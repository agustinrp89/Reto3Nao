pipeline {
  agent any
  
  stages {
    stage('Clone repository') {
      steps {
        git 'https://github.com/agustinrp89/Reto3Nao.git'
      }
    }
    stage('Install dep') {
      steps {
        
          call 'npm install'
          
          //sh 'yarn test'
        
      }
    }
  stage('Testing') {
      steps {
    
        //  sh 'yarn test'
          call 'npm run test'
        
      }
    }
  stage('Build and push Docker image') {
      steps {
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: '6ba74068240689ca3768e41f1fd7dbb5d409cda4c4413f8b3abaebcde104b660',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
          ]]) {
            bat 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 786360065447.dkr.ecr.us-east-2.amazonaws.com'
            bat 'docker build -t radionet .'
            bat 'docker tag radionet:latest 786360065447.dkr.ecr.us-east-2.amazonaws.com/radionet:latest'
            bat 'docker push 786360065447.dkr.ecr.us-east-2.amazonaws.com/radionet:latest'
          }
        }
      }
    }  
  }
