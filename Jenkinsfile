pipeline {
  agent any
  tools{
	jdk 'jdk'
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
    stage('Static Code Analysis'){
	steps{
	  withSonarQubeEnv('sonar-server'){
		sh '$SONAR_SCANNER/bin/sonarqube -Dsonar.projectName=spring-boot-cicd -Dsonar.projectKey=spring-boot-cicd'
          }
	}
    }
	
}
}
