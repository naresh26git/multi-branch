pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('SonarQube Analysis'){
            steps{
                script{
                    def scannerHome = tool 'sonarscanner4'
                    withSonarQubeEnv('sonar-pro') {
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=node.js"
                    }
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t comdevops/multi:v2 .'
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
                        sh "docker login -u comdevops -p ${dockerPassword}"
                        sh 'docker push comdevops/multi:v2'
                        sh 'docker rmi comdevops/multi:v2'
                    }
                }
            }
        }
        stage('dockerdeployment') {
            steps {
                script {
                    sh 'docker run -d -p 8095:8080 --name tomcattest comdevops/multi:v1'
                }
            }
        }
    }
}
