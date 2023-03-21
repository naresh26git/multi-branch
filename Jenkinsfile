pipeline {
    agent any
    tools {
        maven 'maven3' 
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("naresh/hello-world:${TAG}")
                }
            }
        }
    }
}
