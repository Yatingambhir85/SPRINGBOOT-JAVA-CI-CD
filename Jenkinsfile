pipeline {
  agent any
  tools{
	jdk 'jdk'
	maven 'maven'
  }
  environment{
	SONAR_SCANNER = tool 'sonar-scanner'
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
		sh '$SONAR_SCANNER/bin/sonar-scanner -Dsonar.projectName=spring-boot-cicd -Dsonar.projectKey=spring-boot-cicd'
          }
	}
    }
    stage("Docker Build & Deploymnet"){
	steps{
		   sh 'docker build -t ultimate-cicd-spring .'
		   sh 'docker stop ulimate-spring && docker rm ultimate-spring || true'
		   sh 'docker run -itd --name ultimate-spring -p 8010:8010 ultimate-cicd-spring'
	}    
    }
}
}
