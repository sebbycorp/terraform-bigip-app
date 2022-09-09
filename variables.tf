variable "pool_members" {
    description = "List of pool members"
    type        = list(string)
    default     = ""
}
variable "tenant" {
    description = "Tenant name"
    type        = string
    default     = ""
}
variable "vip_address" {
    description = "VIP address"
    type        = string
    default     = ""
}
variable "common_name" {
    description = "Common name"
    type        = string
    default     = ""
}
variable "pki_name" {
    description = "PKI name"
    type        = string
    default     = ""
}
variable "as3tmpl" {
    description = "AS3 template"
    type        = string
    default     = ""
}
variable "pool_members_port" {
    description = "Pool members port"
    type        = string
    default     = "443"
}
variable "monitor" {
    description = "Monitor"
    type        = string
    default     = ""
}
variable "load_balancing_mode" {
    description = "Load balancing mode"
    type        = string
    default = "round-robin"
}
variable "persistence_method" {
    description = "Persistence method"
    type        = string
    default = "cookie"
}
variable "vault_pki_backend" {
    description = "Vault PKI backend"
    type        = string
    default     = ""
}
