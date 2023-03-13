module "this" {
  source  = "git::https://github.com/021CA-FA22/team1-project//MODULE/child/VPC/"
  env_tag = "master"
}

module "that" {
  source = "git::https://github.com/021CA-FA22/team1-project//IAM/"
}
