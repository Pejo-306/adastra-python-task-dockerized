pipeline {
    agent any 
    stages {
        stage("Verify") {
            steps {
                echo "========Verifying system========"
                dir("CICD/stages") {
                    echo "Hello Jenkins from Gogs"
                }
            }
            post {
                success {
                    echo "========Verification successful========"
                }
                failure {
                    echo "========Verification failed========"
                }
            }
        }
    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}