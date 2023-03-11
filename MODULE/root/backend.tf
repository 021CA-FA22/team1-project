terraform {
  backend "s3" {
    bucket = "395524572806"       ## <<<<< You have to use the existing bucket on your (AWS Console) (S3) any buckets that are available or give it random numbers Terraform will be created an (S3) bucket for you!!! 
    key    = "module-tfstate"
    region = "us-east-1"
  }
}