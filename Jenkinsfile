pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'your_image_name'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Use Windows syntax for environment variable
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Use batch script to stop running containers
                    bat '''
                    for /f "tokens=*" %%i in ('docker ps -q') do (
                        docker stop %%i
                    )
                    '''
                }
            }
        }
    }
    post {
        always {
            // Add steps to always run, for example, a simple echo step
            echo 'This will run after the pipeline finishes'
        }
    }
}
