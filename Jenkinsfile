pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your_image_name'  // Replace with your desired image name
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Building Docker image using Dockerfile located in the root directory
                    bat 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Running the container from the Docker image built in the previous stage
                    bat 'docker run -d -p 8080:80 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            echo 'This will run after the pipeline finishes'
        }
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
    }
}
