terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.44"
    }
  }
}

provider "newrelic" {
  account_id = var.account_id
  api_key = var.api_key
  region = var.region
}
