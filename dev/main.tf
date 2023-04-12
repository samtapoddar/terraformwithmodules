provider "aws" {
  region = "ap-south-1"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = "ami-5a8da735"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}

module "s3_bucket" {
  source      = "../modules/s3"
  bucket_name = "example110-bucket"
}

module "db" {
  source = "../modules/db"

  db_name      = "example-db"
  db_username  = "admin"
  db_password  = "password123"
  # subnet_ids   = ["subnet-123456"]
}

output "db_endpoint" {
  value = module.db.db_endpoint
}

