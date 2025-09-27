pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub' // Jenkins ID for DockerHub
        IMAGE_NAME = 'nithyashree/simple-app'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }
}



// pipeline {
//     agent any

//     environment {
//         DOCKER_IMAGE = "nithyashree0910/simple-website"
//     }

//     stages {
//         stage('Checkout Code') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/nithyashree0910/jenkins_practise.git'
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     sh "docker build -t ${DOCKER_IMAGE}:latest ."
//                 }
//             }
//         }

//         stage('Push to DockerHub') {
//             steps {
//                 script {
//                     withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
//                         sh """
//                         echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
//                         docker push ${DOCKER_IMAGE}:latest
//                         docker logout
//                         """
//                     }
//                 }
//             }
//         }
//     }

//     post {
//         success {
//             echo "✅ Docker image built and pushed: ${DOCKER_IMAGE}:latest"
//         }
//         failure {
//             echo "❌ Build failed, check logs!"
//         }
//     }
// }
