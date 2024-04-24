pipeline { 
    environment {
        IMAGE = "nikhilsaieppa/sample_prjt"
        registryCredential='Nikhilsai_test'
        dockerImage = ''
    }
    agent any 
    stages {
        stage('checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/NikhilSaiEppa/Jenkins.git'
            }
        }

        stage('Build'){
            steps{
                script{
                    dockerImage=docker.build "${IMAGE}:latest"
                }
            }
        }

        
        stage(' push image to  dockerhub') {
            steps {
                script{
                    docker.withRegistry('', registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Running the container') {
            steps {
                sh 'docker run -d -p 80:80 --name sample_project ${IMAGE}:latest'
            }
        }
    } 
}
