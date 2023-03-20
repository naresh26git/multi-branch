node{
    stage('Compile-Package') {
        sh 'mvn clean compile'
    }
    stage( 'build image') {
        sh 'docker build -t naresh/javamulti .'
        sh 'docker images'
    }
}
