include {
  path = find_in_parent_folders("root.hcl")
}

include {
  path = find_in_parent_folders("env.hcl")
}

terraform {
  source = "git::https://github.com/GergoNagy94/module-versions-demo-catalog//modules/vpc?ref=main"
}

inputs = {
  cidr            = local.env_vars.vpc_cidr
  azs             = env_vars.availability_zone
  private_subnets = [for k, v in local.env.locals.availability_zone : cidrsubnet(local.env.locals.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.env.locals.availability_zone : cidrsubnet(local.env.locals.vpc_cidr, 8, k + 48)]

  create_egress_only_igw = local.env.locals.vpc_create_egress_only_igw
  enable_dns_hostnames   = local.env.locals.vpc_enable_dns_hostnames
  enable_dns_support     = local.env.locals.vpc_enable_dns_support
  enable_nat_gateway     = local.env.locals.vpc_nat_gateway
  single_nat_gateway     = local.env.locals.vpc_single_nat_gateway

  tags = local.env.locals.tags
}

skip = local.env.locals.skip_module.vpc
