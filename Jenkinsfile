pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-credentials-id') // Replace with your Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials-id') // Replace with your Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        checkout scm
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Checkout failed: ${e.message}"
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    try {
                        sh 'terraform init'
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Terraform Init failed: ${e.message}"
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    try {
                        sh 'terraform plan -out=tfplan'
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Terraform Plan failed: ${e.message}"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    try {
                        sh 'terraform apply -auto-approve tfplan'
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Terraform Apply failed: ${e.message}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }

        success {
            echo 'Pipeline succeeded!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
