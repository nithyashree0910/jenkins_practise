pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nithyashree0910/simple-website"
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
                    // Tag with build number for versioning
                    sh "docker build -t %DOCKER_IMAGE%:latest ."
                }
            }
        }


        stage('Push to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]){
                        sh """
                        echo %DOCKER_PASS% |
                        docker login -u %DOCKER_USER% --password-stdin
                        docker push %DOCKER_IMAGE%:latest
                        docker logout
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Docker image built and pushed: ${DOCKER_IMAGE}:${BUILD_NUMBER}"
        }
        failure {
            echo "❌ Build failed, check logs!"
        }
    }
}
