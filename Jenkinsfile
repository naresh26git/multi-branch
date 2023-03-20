node{
    stage( 'compile-package' ) {
   def mvnHome =  tool name: 'maven3', type: 'maven'   
      sh "${mvnHome}/bin/mvn clean package"
      sh 'mv target/onlinebookstore*.war target/newbook.war'
          }
    stage( 'build image') {
        sh 'docker build -t naresh/javamulti .'
        sh 'docker images'
    }
}
