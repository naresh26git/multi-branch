node{
   stage('Compile-Package'){
       def mvnHome =  tool name: 'maven3', type: 'maven'
       sh "mvn clean install"
       sh 'mv target/onlinebookstore*.war target/newbook.war'
   }
   stage('SonarQube Analysis') {
	        def mvnHome =  tool name: 'maven3', type: 'maven'
	        withSonarQubeEnv('sonar-pro') { 
	          sh "${mvnHome}/bin/mvn sonar:sonar"
	        }
	    }
   stage('Build Docker Imager'){
   sh 'docker build -t comdevops/multi:v1 .'
   }
   stage('Docker Image Push'){
   withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
   sh "docker login -u comdevops -p ${dockerPassword}"
    }
   sh 'docker push comdevops/javav1:v1'
   sh 'docker rmi -f comdevops/javav1:v1'
   }
   stage('minikube start'){
    withKubeCredentials(kubectlCredentials: [[ credentialsId: 'kube', namespace: 'ms' ]]) {
        sh 'kubectl apply -f kube.yaml'
        sh 'kubectl get pods -o wide'
    }
   }
}
