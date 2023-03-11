module "this" {
  source                = "git::https://github.com/021CA-FA22/team1-project//MODULE/child/VPC/"
  vpc_cidr_block        = "10.0.0.0/16"
  env_tag               = "master"
  aws_availability_zone = data.aws_availability_zone.us-east-1a.name
  public_subnet_cidr    = "10.0.0.0/24"
  private_subnet_cidr_1 = "10.0.1.0/24"
  private_subnet_cidr_2 = "10.0.2.0/24"
  private_subnet_cidr_3 = "10.0.3.0/24"
}

module "that" {
  source                     = "git::https://github.com/021CA-FA22/team1-project//MODULE/child/VPC/"
  vpc_cidr_block             = "10.0.0.0/16"
  env_tag                    = "main"
  availability_zone          = data.aws_availability_zone.us-east-1b.name
  public_subneet_cidr        = "10.0.0.0/24"
  private_subnet_cidr_first  = "10.0.1.0/24"
  private_subnet_cidr_second = "10.0.2.0/24"
  private_subnet_cidr_third  = "10.0.3.0/24"
}