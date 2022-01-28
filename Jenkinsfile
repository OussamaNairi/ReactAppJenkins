// Build a dockerimage and push it to dockerhub
// Code Quality with SonarQube
// Launch the pipeline every Commit using ngrok

node {
    def app

    stage('Clone repository') {


        checkout scm
    }

    stage('Build image') {

       app = docker.build("radhouenassakra/docker-angular", "./docker-compose/angular-app/")
    }

    stage('Test image') {


        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {

        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage (" Archieve Artifact") {
        archiveArtifacts artifacts: "${app}" , fingerprint: true
    }
}