pipeline {
  agent any
  tools{
	jdk 'jdk18'
	maven 'maven'
  }
  environment{
	SONAR_SCANNER = tool 'sonarqube'
  }	
  stages {
    stage('Checkout') {
      steps {
        sh 'echo passed'
	git branch: 'main', url: 'https://github.com/Yatingambhir85/SPRINGBOOT-JAVA-CI-CD'
      }
    }
    stage('Build and Test') {
      steps {
        // build the project and create a JAR file
        sh 'mvn clean package'
      }
    }
}
}
