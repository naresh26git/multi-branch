pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                script{
                     sh 'npm install'
                }
            }
        }
        // stage ('SonarQube Analysis') {
        //     steps {
        //         script { 
        //             def scannerHome = tool 'sonarscanner4'
        //             withSonarQubeEnv('sonar-pro') {
        //                 sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=node.js-app"
        //             }
        //         }
        //     }
        // }
        stage('Docker Build Images') {
            steps {
                script {
                    sh 'docker build -t naresh2603/multi:v2 .'
                    sh 'docker images'
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
                        sh "docker login -u naresh2603 -p ${dockerPassword}"
                        sh 'docker push naresh2603/multi:v2'
                        sh 'docker rmi naresh2603/multi:v2'
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
