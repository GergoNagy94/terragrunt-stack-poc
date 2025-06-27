locals {
    project         = "terragrunt-gergo"
    project_version = "v1.0.0"

    organization_id        = "o-00000000000"
    organization_root_id   = "r-0000"

    management_account_id  = "940482431327"
    monitoring_account_id  = "940482431327"
    production_account_id  = "940482431327"
    development_account_id = "940482431327"

    management_account_email  = "aws+management@terragrunt.com"
    monitoring_account_email  = "aws+monitoring@terragrunt.com"
    production_account_email  = "aws+production@terragrunt.com"
    development_account_email = "aws+development@terragrunt.com"
}