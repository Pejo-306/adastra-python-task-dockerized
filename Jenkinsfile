pipeline {
    agent any 
    stages {
        stage("Verify") {
            steps {
                echo "========Verifying system========"
                dir("CICD/stages") {
                    sh "chmod +x ./00-verify.sh"
                    sh "./00-verify.sh"
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