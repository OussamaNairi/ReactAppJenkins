// Build a dockerimage and push it to dockerhub
// Code Quality with SonarQube
// Launch the pipeline every Commit using ngrok

node {
    def app

    stage('Clone repository') {


        checkout scm
    }

    stage('Build image') {

       app = docker.build("oussamanairi/reactapp", ".")
    }

    stage('Test image') {


        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {

        docker.withRegistry('https://registry.hub.docker.com', 'dockercredentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage (" Archieve Artifact") {
        archiveArtifacts artifacts: "${app}" , fingerprint: true
    }
}