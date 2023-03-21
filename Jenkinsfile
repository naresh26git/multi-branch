pipeline {
    agent any
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
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
                }
            }
        }
    }
}
