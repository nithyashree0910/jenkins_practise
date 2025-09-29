pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        IMAGE_NAME = 'nithyashree0910/simple-ecr'
        REPO_NAME = 'test'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
            }
        }

        stage('Tag the image') {
            steps {
                script {
                    IMAGE_TAG = 'latest'
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                   withAWS(region: "$(env.AWS_REGION)", credentials:'aws_creds') {
                       powershell '''
                       $ecrLogin = aws ecr get-login-password --region $env.AWS_REGION

                       docker login --username AWS --password $ecrLogin https://509399595231.dkr.ecr.ap-south-1.amazonaws.com
                       '''
                   }
                }
            }
            stage("Build docker image"){
                steps{
                    powershell '''
                    docker build -t $env.IMAGE_NAME:$env.IMAGE_TAG .
                    docker tag $env.IMAGE_NAME:$env.IMAGE_TAG 509399595231.dkr.ecr.ap-south-1.amazonaws.com/test:latest
                    '''
                }
            }
            stage("Push to ecr"){
                steps{
                    powershell '''
                    docker push 509399595231.dkr.ecr.ap-south-1.amazonaws.com/test:latest
                    '''
                    
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
