pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        IMAGE_NAME = 'nithyashree0910/simple-ecr'
        IMAGE_TAG = 'latest'
        REPO_URI = '509399595231.dkr.ecr.ap-south-1.amazonaws.com/test'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
            }
        }

        stage('Login to ECR') {
            steps {
                withAWS(credentials: 'aws_creds', region: "${env.AWS_REGION}") {
                    sh '''
                        aws ecr get-login-password --region ${AWS_REGION} | \
                        docker login --username AWS --password-stdin ${REPO_URI}
                    '''
                }
            }
        }

        stage("Build Docker Image") {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${REPO_URI}:${IMAGE_TAG}
                '''
            }
        }

        stage("Push to ECR") {
            steps {
                sh '''
                    docker push ${REPO_URI}:${IMAGE_TAG}
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 Successfully built and pushed ${IMAGE_NAME}:${IMAGE_TAG} to ${REPO_URI}"
        }
        failure {
            echo "❌ Build or push failed. Check logs."
        }
    }
}
