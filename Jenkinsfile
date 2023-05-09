pipeline {
    agent any
    tools {
        maven 'maven3' 
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
                sh 'mv target/onlinebookstore*.war target/newbook.war'
            }
        }
        stage ('sonar-qube') {
            steps {
                def mvn = tool 'maven3'
                withSonarQubeEnv('sonar-pro') {
                    sh "${mvnHome}/bin/mvn sonar:sonar"
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t comdevops/multi:v1 .'
                    sh 'docker images'
                }
            }
        }
        
    }
}
