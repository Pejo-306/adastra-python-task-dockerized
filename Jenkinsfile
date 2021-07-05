pipeline {
    agent any 
    stages {
        stage("Verify") {
            steps {
                echo "========Start verifying system========"
                sh "chmod +x ./CICD/stages/00-verify.sh"
                sh "./CICD/stages/00-verify.sh"
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
        stage("Build") {
            steps {
                echo "========Start buildding project========"
                sh "chmod +x ./CICD/stages/01-build.sh"
                sh "./CICD/stages/01-build.sh"
            }
            post {
                success {
                    echo "========Build successful========"
                }
                failure {
                    echo "========Build failed========"
                }
            }
        }
        stage("Test") {
            steps {
                echo "========Start testing project========"
                sh "chmod +x ./CICD/stages/02-test.sh"
                sh "./CICD/stages/02-test.sh"
            }
            post {
                success {
                    echo "========Test successful========"
                }
                failure {
                    echo "========Test failed========"
                }
            }
        }
    }
    post {
        success {
            echo "========pipeline executed successfully ========"
        }
        failure {
            echo "========pipeline execution failed========"
        }
    }
}