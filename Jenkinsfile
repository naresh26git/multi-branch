pipeline {
    agent any
    tools {
        maven 'maven3' 
    }
    stages {
        stage ('Build') {
            steps {
                script{
                def mvnHome =  tool name: 'maven3', type: 'maven'
                sh 'mvn clean install'
                sh 'mv target/onlinebookstore*.war target/newbook.war'
                }
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
                    sh 'docker build -t comdevops/multi:v2 .'
                    //sh 'docker images'
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
                        sh "docker login -u comdevops -p ${dockerPassword}"
                        sh 'docker push comdevops/multi:v2'
                    }
                }
            }
        }
        stage('Deploy on k8s') {
            steps {
                script {
                    withKubeCredentials(kubectlCredentials: [[ credentialsId: 'kubernetes', namespace: 'ms' ]]) {
                        sh 'kubectl apply -f kube.yaml'
                        sh 'kubectl get pods -o wide'
                    }
                }
            }
        }
    }
}
