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
  stage('Build and push Docker image') {
      steps {
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding', 
            credentialsId: 'agustin_mdp89',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
          ]]) {
            bat 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 786360065447.dkr.ecr.us-east-2.amazonaws.com'
            bat 'docker build -t jenkins-pipeline .'
            bat 'docker tag jenkins-pipeline:latest 786360065447.dkr.ecr.us-east-2.amazonaws.com/jenkins-pipeline:latest'
            bat 'docker push 786360065447.dkr.ecr.us-east-2.amazonaws.com/jenkins-pipeline:latest'
           
          }
        }
      }
    }  
  }
