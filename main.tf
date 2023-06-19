terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0889a44b331db0194"
  instance_type = "t2.micro"
  tags = {
    Name       = "FinanceTech"
    Dept       = "tech"
    Costcentre = "finance"
  }

}
resource "aws_s3_bucket" "FinanceTech" {
  bucket = "new-car-release-bucket"

  tags = {
    Name        = "tech"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "aclFinanceTech" {
  bucket = aws_s3_bucket.FinanceTech.id
  acl    = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.FinanceTech.id
  rule {
    object_ownership = "ObjectWriter"
  }
}