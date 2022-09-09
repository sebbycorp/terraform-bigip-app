terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.15.1"
    }
  }
}


provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}
