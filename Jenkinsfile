pipeline {
  agent any
   tools {
        nodejs '17.3.1'
    }
  stages {
    stage('Clone repository') {
      steps {
        git 'https://github.com/agustinrp89/Reto3Nao.git'
      }
    }
    
    stage('Install dep') {
      steps {
        sh 'npm install'
        
        // sh 'yarn test'
      }
    }
    
    stage('Testing') {
      steps {
        // sh 'yarn test'
        sh 'npm run test'
      }
    }
    
    stage('Build and push Docker image') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding', 
           credentialsId: 'agustin_mdp89',
           accessKeyVariable: 'AWS_ACCESS_KEY_ID',
           secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']
        ]) {
          sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 786360065447.dkr.ecr.us-east-2.amazonaws.com'
          sh 'docker build -t jenkin-pipeline .'
          sh 'docker tag jenkin-pipeline:latest 786360065447.dkr.ecr.us-east-2.amazonaws.com/jenkin-pipeline:latest'
          sh 'docker push 786360065447.dkr.ecr.us-east-2.amazonaws.com/jenkin-pipeline:latest'
        }
      }
    }
  }  
}
