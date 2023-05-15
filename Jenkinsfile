node{
   stage('Build'){
       def mvnHome =  tool name: 'maven3', type: 'maven'
       sh 'mvn clean package'
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
   stage('deploy on k8s') {
       //sh 'minikube stop'
       //sh 'minikube stop'
       //sh 'minikube delete'
       //sh 'minikube start'
       //sh 'kubectl create ns ms'
       //sh 'kubectl config set-context --current --namespace=ms'
       sh 'kubectl create secret generic javapipe --from-file=.dockerconfigjson=/opt/docker/config.json -n ms --type kubernetes.io/dockerconfigjson --dry-run=client -oyaml > secret.yaml'
       sh 'kubectl apply -f secret.yaml'
       sh 'kubectl delete svc java-app'
       sh 'kubectl delete deployment java-app'
       sh 'kubectl apply -f kube.yaml'
       sh 'kubectl get pods -o wide'
       sh 'kubectl get svc'
       sh 'kubectl get deployment'
       sh 'kubectl get node -o wide'
   }
}
