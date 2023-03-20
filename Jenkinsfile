pipeline {
    agent any

    stages {

            steps {
                    sh 'mvn clean compile'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                    sh 'mvn test'
                }
            }

        stage ('Deployment Stage') {
            steps {
                    sh 'mvn deploy'
                }
        }
        
        
