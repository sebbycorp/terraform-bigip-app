terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.15.1"
    }
  }
}

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}

provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}