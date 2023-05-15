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
        stage ('SonarQube') {
            steps {
                script { 
                    def mvnHome =  tool name: 'maven3', type: 'maven'
                    withSonarQubeEnv('sonar-pro') {
                        sh "${mvnHome}/bin/mvn sonar:sonar"
                    }
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
        stage('Docker Push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
                        sh "docker login -u comdevops -p ${dockerPassword}"
                        sh 'docker push comdevops/multi:v1'
                        sh 'docker rmi comdevops/multi:v1'
                    }
                }
            }
        }
        stage('deploy on k8s') {
            steps {
                script {
                    sh 'minikube status'
                    sh 'minikube delete'
                    sh 'minikube start'
                }
            }
        }
    }
}
