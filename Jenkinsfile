pipeline {
    environment {
    registry = "jenkinscicd/opencart"
    registryCredential = 'acr'
    dockerImage = ''
	registryUrl = 'jenkinscicd.azurecr.io'
  }
   agent none
    stages {   
	stage('SCM Checkout') {
	    agent {label 'wsl'}
            steps {
                git credentialsId: 'git_credentials', url: 'https://github.com/nikhilsharma6311/opencartdocker.git'
                }
        }
        stage('Building Docker Image') {
          agent {label 'wsl'}
        steps {
            script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                echo "Builded Successfully"
                  }
            }
		}
    stage('Pushing Docker-Image to Dockerhub') {
	  agent {label 'wsl'}   
        steps {
             echo "Pushed Succesfully" 
             script {
                 docker.withRegistry( "http://${registryUrl}", registryCredential ) {
				         dockerImage.push("$BUILD_NUMBER")
                         dockerImage.push('latest')
                 }
            }   
        }
    }
	}
}
