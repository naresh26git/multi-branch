pipeline {
    agent any
    tools {
        maven 'maven3' 
    }
    stages {
      stage ('Build') {
        steps {
          script{
            def mvnHome = tool name: 'maven3', type: 'maven'
            sh "${mvnHome}/bin/mvn clean package"
              sh 'mv target/onlinebookstore*.war target/mybook.war'
              // sh "mvn clean package"
              // sh "mv target/*.war target/mybook.war"
          }
        }
      }
      // stage ('SonarQube'){
      //   steps{
      //     script{
      //       def mvnHome =  tool name: 'maven3', type: 'maven'
      //       withSonarQubeEnv('sonar-pro') {
      //         sh "${mvnHome}/bin/mvn sonar:sonar"
      //       }
      //     }
      //   }
      // }
      stage('Docker Build') {
        steps{
          script{
            sh 'docker build -t naresh2603/multi:v3 .'
            //sh 'docker images'
          }
        }
      }
      stage('Docker push'){
        steps{
          script{
            withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
              sh "docker login -u naresh2603 -p ${dockerPassword}"
              sh 'docker push naresh2603/multi:v1'
              sh 'docker rmi naresh2603/multi:v1'
            }
          }
        }
      }
    }
}

//       stage('Deploy on k8s') {    
//         steps {
//           script{
//             withKubeCredentials(kubectlCredentials: [[ credentialsId: 'kubernetes', namespace: 'ms' ]]) {
//                 sh 'kubectl apply -f kube.yaml'
//             }
//           }
//         }
//       }
//     }
// }
