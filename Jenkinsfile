pipeline {
    agent any
    tools {
        maven 'maven3' 
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
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
                    //sh 'minikube stop'
                    //sh 'minikube delete'
                    //sh 'minikube start'
                    //sh 'kubectl create ns ms'
                    //sh 'kubectl config set-context --current --namespace=ms'
                    //sh 'kubectl create secret generic javapipe --from-file=.dockerconfigjson=/opt/docker/config.json -n ms --type kubernetes.io/dockerconfigjson --dry-run=client -oyaml > secret.yaml'
                    //sh 'kubectl apply -f secret.yaml'
                    sh 'kubectl apply -f kube.yaml'
                    sh 'kubectl get pods -o wide'
                    sh 'kubectl get svc'
                    sh 'kubectl get deployment'
                    sh 'kubectl get node -o wide'
                }
            }
        }
    }
}
