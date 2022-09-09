variable "vault_addr" {
    description = "Vault address"
    type        = string
}

variable "vault_token" {
    description = "Vault token"
    type        = string
}

variable "bigipmgmt" {
    description = "BigIP management IP"
    type        = string
}

variable "bigipmgmtuser" {
    description = "BigIP management user"
    type        = string
}

variable "bigippass" {
    description = "BigIP management password"
    type        = string
}