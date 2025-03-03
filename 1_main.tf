provider "aws" {
  access_key = "123456"
  secret_key = "hjghvhhfgjhyhjguhggj"
  region     = "us-west-2"
  version    = "~> 4.0"  # Specify a version range that works for your setup
}


resource "aws_instance" "ourfirst" {
  ami           = "ami-00c257e12d6828491"
  instance_type = "t2.micro"
}

