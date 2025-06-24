unit "vpc" {
  source = "git::git@github.com:GergoNagy94/module-versions-demo-catalog//units/vpc?ref=main"

  path = "vpc"

  values = {
    cidr                   = "10.0.0.0/16"
    private_subnets        = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
    public_subnets         = ["10.0.48.0/24", "10.0.49.0/24", "10.0.50.0/24"]
    enable_nat_gateway     = true
    single_nat_gateway     = true
    create_egress_only_igw = true
    enable_dns_hostnames   = true
    enable_dns_support     = true
    region                 = "eu-west-1"
    azs                    = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  }
}