terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "germy"
    default_tags {
      tags = {
        application_id            = "dmt468"
        owner                     = "developers-name"
        environment               = "prod"
        budget_code               = "cost_prod"
        patch_group               = "pg-prod"
        compliance_classification = "nist"
        data_classification       = "pii"
        LOB                       = "e-commerce"
        project_manager           = "alexander-dirus"
        project_name              = "ventura-project"
      }

    }
  # Configuration options
}