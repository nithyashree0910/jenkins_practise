pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'        // Jenkins credential ID for DockerHub
        IMAGE_NAME = 'nithyashree0910/simple-app'  // DockerHub repo name
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:latest .'
                }
            }
        }

        stage('Login to DockerHub & Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", 
                                                      usernameVariable: 'DOCKER_USER', 
                                                      passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh 'docker push $IMAGE_NAME:latest'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Successfully built and pushed $IMAGE_NAME:latest to DockerHub"
        }
        failure {
            echo "❌ Build or push failed. Check logs."
        }
    }
}
