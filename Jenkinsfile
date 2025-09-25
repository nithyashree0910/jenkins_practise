pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/nithyashree0910/jenkins_practise'
            }
        }
        stage('Build'){
            steps {
               sh 'echo "Building the app"'
            }
        }
        stage('Test'){
            steps {
               sh 'echo "Running Tests"'
            }
        }
        stage('Deploy'){
            steps{
                sh 'echo "Deploying the application"'
            }
        }
    }
}
