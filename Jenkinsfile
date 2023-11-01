pipeline {
    agent any
    
    stages {
        stage("Clean up stage") {
            steps {
                echo "Clean up stage"
                cleanWs notFailBuild: true
            }
        }
        
        stage("Git checkout stage") {
            steps {
                echo "Git checkout stage"
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/luidimso/test-with-karate.git']])
            }
        }
        
        stage("Restore package stage") {
            steps {
                echo "Restore package stage"
            }
        }
        
        stage("Build stage") {
            steps {
                echo "Build stage"
                sh "mvn clean compile"
            }
        }
        
        stage("Test stage") {
            steps {
                echo "Test started"
                sh "mvn test"
                echo "Test ended"
            }
        }
    }
    
    post {
      always {
        junit 'target/surefire-reports/*.xml'
        cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.xml', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate BDD Test', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
      }
    }
}