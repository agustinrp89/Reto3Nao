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
          

            bat 'docker build -t radionet .'
            bat 'docker run -d -p 8088:80 --name reto3nao docker/reto3nao'
            
       
        }
      }
    }  
  }
