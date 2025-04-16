pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your_image_name'
        DOCKER_PORT = '8081'  // Set a different port if needed
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
                    bat "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container using a different port if 8080 is unavailable
                    bat "docker run -d -p ${DOCKER_PORT}:80 ${DOCKER_IMAGE}"
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
