pipeline {
    agent any
 environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') // Replace with the Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Replace with the Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Plan the Terraform deployment
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform deployment
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
