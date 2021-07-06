pipeline {
    agent any 
    environment {
        REGISTRY = "127.0.0.1:5000"
        BUILD_TAG = "local"
        PROD_ENGINE = "ip172-18-0-38-c3i9bd7njsv000fin8l0@direct.labs.play-with-docker.com"
    }
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
        stage("Push to local registry") {
            steps {
                echo "========Start pushing project========"
                sh "chmod +x ./CICD/stages/03-push.sh"
                sh "./CICD/stages/03-push.sh"
            }
            post {
                success {
                    echo "========Push successful========"
                }
                failure {
                    echo "========Push failed========"
                }
            }
        }
        stage("Await approval to deploy") {
            steps {
                input message: "Deploy to production?"
            }
        }
        stage("Deploy") {
            steps {
                echo "========Start deploying to production========"
                sh "chmod +x ./CICD/stages/04-deploy.sh"
                sh "./CICD/stages/04-deploy.sh"
            }
            post {
                success {
                    echo "========Deployment successful========"
                }
                failure {
                    echo "========Deployment failed========"
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