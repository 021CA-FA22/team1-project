terraform {
  backend "s3" {
    bucket = "395524572806"
    key    = "module-tfstate"
    region = "us-east-1"
  }
}