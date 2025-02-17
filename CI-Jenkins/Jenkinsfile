pipeline{
    agent any
    stages {
        stage ("Code checkout") {
            steps {
                echo 'Checking out code from the master branch...'
                git branch: 'master', url: 'https://github.com/anuja2015/Canara-CI-App.git'
            }
        }
        stage ("Compiling the code") {
            steps {
               
                sh 'mvn clean compile'
                
            }
            
        }
        stage("Build package") {
            steps {
                sh 'mvn package'
                
            }
        }
    }
    post {
        always{
          archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false  
        }
        
    }
}
