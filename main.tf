###########################
# CONFIGURATION
###########################

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  # cloud {
  #   organization = "inmarsat"

  #   workspaces {
  #     name = "CIOP-AWS-GATEWAYDOCUMENTS-dev"
  #   }
  # }

}

###########################
# PROVIDERS
###########################

provider "aws" {
  region = var.aws_region
}

