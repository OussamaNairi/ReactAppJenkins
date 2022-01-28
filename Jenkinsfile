pipeline {
  agent any
    
  tools {nodejs "node14"}
    
  stages {
        
    stage('Clone repository') {
       steps{
            checkout scm
       }
       
    }
     
    stage('Build') {
      steps {
        sh 'npm install'
         sh 'npm run build'
      }
    }  
    
            
    stage('Test') {
      steps {
        sh 'echo "hello world"'
      }
    }


  }
      post {
        always {
            archiveArtifacts artifacts: 'build', onlyIfSuccessful: true
        }
    }
}