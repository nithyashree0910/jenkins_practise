pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
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
