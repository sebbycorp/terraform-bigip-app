resource "vault_namespace" "namespacepath" {
  path = var.vault_namespace
}
resource "vault_pki_secret_backend_cert" "app" {
  backend     = var.vault_pki_backend
  name        = var.pki_name
  common_name = var.common_name
  namespace   = vault_namespace.namespacepath.path
}

resource "bigip_as3" "app_services" {
  as3_json = local.as3_json
}

resource "local_file" "as3" {
  content  = local.as3_json
  filename = "${path.module}/as3-bigip.json"
}

locals {
  as3_json = templatefile("${path.module}/as3templates/${var.as3tmpl}.tpl", {
    TENANT            = var.tenant
    VIP_ADDRESS       = var.vip_address
    DESCRIPTION       = var.common_name
    POOL_NAME         = "${var.common_name}_pool"
    MY_POOLMEMBERS    = jsonencode(var.pool_members)
    SSL_PROFILE       = "${var.common_name}_ssl"
    TLS_CERT          = "${var.common_name}_cert"
    POOLMEMBERS_PORT  = var.pool_members_port
    MONITOR           = var.monitor
    LOADBALANCEMODE   = var.load_balancing_mode
    TCP_PROFILE       = "${var.common_name}_tcp"
    HTTP_PROFILE      = "${var.common_name}_http"
    PERSISTENCE       = "${var.common_name}_persistence"
    PERSISTENCEMETHOD = var.persistence_method
    CERT              = jsonencode(vault_pki_secret_backend_cert.app.certificate)
    KEY               = jsonencode(vault_pki_secret_backend_cert.app.private_key)
    CA_CHAIN          = jsonencode(vault_pki_secret_backend_cert.app.ca_chain)
  })
}



