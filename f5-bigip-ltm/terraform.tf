terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.15.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.5.0"
    }
  }
}
