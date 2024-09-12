pipeline {
    agent any
 
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
