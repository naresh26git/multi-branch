pipeline {
	agent any
	tools {
	    maven "maven3"
	}
    stage('Build'){ 
	        steps{
	           sh 'mvn clean install'
	        }
    }
}
