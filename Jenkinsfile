pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t naresh/node:v2 .'
                    sh 'docker images'
                }
            }
        }
    }
}
