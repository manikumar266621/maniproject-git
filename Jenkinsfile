pipeline {
    agent any

    environment {
        TF_VAR_example = 'value' // Example of setting Terraform environment variables
        AWS_ACCESS_KEY_ID = credentials('aws-access-key') // Jenkins credentials ID for AWS access key
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key') // Jenkins credentials ID for AWS secret key
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=plan.tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -input=false plan.tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Cleans up the workspace after the build
        }
        success {
            echo 'Terraform operations completed successfully!'
        }
        failure {
            echo 'Terraform operations failed!'
        }
    }
}
