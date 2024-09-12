pipeline {
    agent any

    environment {
        // Use Jenkins credentials for AWS access
        AWS_ACCESS_KEY_ID = credentials('aws-credentials-id') // Replace with your Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials-id') // Replace with your Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
