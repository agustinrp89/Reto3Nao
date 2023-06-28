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
            accessKeyVariable: 'AKIA3OFVWLWTTR7ON5YF',
            secretKeyVariable: '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'
        ]]) {
            script {
                // Mask sensitive information
                maskPasswords(env.AKIA3OFVWLWTTR7ON5YF, env.'NHk1PprZ5sH/+9RAioevbmt7f2rmL73g3OBaZcyx')

                // Execute your commands here
                bat '(Get-ECRLoginCommand).Password | docker login --username AWS --password-stdin 786360065447.dkr.ecr.us-east-2.amazonaws.com'
                bat 'docker build -t jenkins-pipeline .'
                bat 'docker tag jenkins-pipeline:latest 786360065447.dkr.ecr.us-east-2.amazonaws.com/jenkins-pipeline:latest'
                bat 'docker push 786360065447.dkr.ecr.us-east-2.amazonaws.com/jenkins-pipeline:latest'
            }
        }
    }
}
    }  
  }
