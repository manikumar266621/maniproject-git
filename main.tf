# main.tf

provider "aws" {
  region = "us-east-1" # Change this to your desired region
}

# Example of creating an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0a5c3558529277641" # Update this to a valid AMI ID in your region
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
