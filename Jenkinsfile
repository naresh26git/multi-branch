node{
   stage('Compile-Package'){
    def mvnHome =  tool name: 'maven3', type: 'maven'
    sh "${mvnHome}/bin/mvn clean package"
    sh 'mv target/onlinebookstore*.war target/newbook.war'
   }
   stage('SonarQube Analysis') {
    def mvnHome =  tool name: 'maven3', type: 'maven'
	withSonarQubeEnv('sonar-pro') {
        sh "${mvnHome}/bin/mvn sonar:sonar"
    }
   }
   stage('Build Docker Imager'){
    sh 'docker build -t comdevops/multi:v2 .'
   }
   stage('Docker Image Push'){
    withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
        sh "docker login -u comdevops -p ${dockerPassword}"
        sh 'docker push comdevops/multi:v2'
        sh 'docker rmi -f comdevops/multi:v2'
    }
   }
   stage('deploy on k8s'){
    withKubeCredentials(kubectlCredentials: [[ credentialsId: 'kubernetes', namespace: 'ms' ]]) {
        sh 'kubectl apply -f kube.yaml'
        sh 'kubectl get pods -o wide'
    }
   }
}
