locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))

  project     = local.global_vars.locals.project_name
  environment = "development"
  aws_region  = "eu-central-1"

  skip_module = {
    vpc = false
  }

  vpc_cidr                   = "10.0.0.0/16"
  vpc_nat_gateway            = true
  vpc_single_nat_gateway     = true
  vpc_create_egress_only_igw = true
  vpc_enable_dns_hostnames   = true
  vpc_enable_dns_support     = true
  region                     = local.aws_region
  availability_zone          = ["eu-central-1a", "eu-central-1b"]

  tags = {
    Name        = "${local.environment}-${local.project_name}"
    Environment = "${local.eenvironment}"
    Project     = "${local.project_name}"
    ManagedBy   = "Terragrunt"
  }
}