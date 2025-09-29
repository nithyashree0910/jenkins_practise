pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        IMAGE_NAME = 'nithyashree0910/simple-ecr'
        REPO_NAME  = 'test'
        IMAGE_TAG  = 'latest'
        ECR_URL    = '509399595231.dkr.ecr.ap-south-1.amazonaws.com'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    withAWS(region: "${env.AWS_REGION}", credentials: 'aws_creds') {
                        powershell '''
                        aws ecr get-login-password --region ${env:AWS_REGION} |
                          docker login --username AWS --password-stdin ${env:ECR_URL}
                        '''
                    }
                }
            }
        }

        stage("Build Docker Image") {
            steps {
                powershell '''
                docker build -t ${env:IMAGE_NAME}:${env:IMAGE_TAG} .
                docker tag ${env:IMAGE_NAME}:${env:IMAGE_TAG} ${env:ECR_URL}/${env:REPO_NAME}:${env:IMAGE_TAG}
                '''
            }
        }

        stage("Push to ECR") {
            steps {
                powershell '''
                docker push ${env:ECR_URL}/${env:REPO_NAME}:${env:IMAGE_TAG}
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 Successfully built and pushed ${env.IMAGE_NAME}:${env.IMAGE_TAG} to ECR"
        }
        failure {
            echo "❌ Build or push failed. Check logs."
        }
    }
}
