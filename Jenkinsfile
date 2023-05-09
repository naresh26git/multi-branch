pipeline {
    agent any
    tools {
        maven 'maven3' 
    }
     environment {

      sonar_url = 'http://180.151.249.202:9000/'
      sonar.login= '098aae5895384d95848afee8440c2bf7f7e7f83b'
      //sonar_username = 'admin'
      //sonar_password = 'admin'
      //nexus_url = 'IP:8081'
      //artifact_version = '4.0.0'

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
                //def mvnHome =  tool name: 'maven3', type: 'maven'
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
