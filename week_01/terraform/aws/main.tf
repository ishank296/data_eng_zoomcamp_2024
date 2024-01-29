provider "aws" {
  region  = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "web" { 
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    tags = {
      Name = "Terraform Project_01"
    }
}

# Create a VPC
#resource "aws_vpc" "example" {
#  cidr_block = "10.0.0.0/16"
#}

# resource "aws_s3_bucket" "example" {
#   bucket = "my-tf-test-bucket"

#   tags = {
#     Name        = "My123354465bucket"
#     Environment = "Dev"
#   }
# }

# docker run --rm -it -v "$(pwd)\terraform\aws:/apps" hashicorp/terraform -chdir=/apps plan
# docker run --rm -it -v "$(pwd)\terraform\aws:/apps" hashicorp/terraform -chdir=/apps apply
# docker run --rm -it -v "$(pwd)\terraform\aws:/apps" hashicorp/terraform -chdir=/apps destroy

