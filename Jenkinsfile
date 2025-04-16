pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-docker-webapp:latest"
        DOCKER_REGISTRY = "docker.io"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from GitHub
                git 'https://github.com/archis04/my-docker-webapp.git'
            }  // Close the Checkout stage here
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile
                script {
                    bat 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container in detached mode, exposing port 8081
                script {
                    bat 'docker run -d -p 8081:80 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            // Clean up: Stop and remove the running container after the build
            script {
                bat 'docker ps -q | xargs -I {} docker stop {}'
                bat 'docker ps -a -q | xargs -I {} docker rm {}'
            }
        }
    }
}
