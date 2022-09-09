module "app" {
  source            = "sebbycorp/app/bigip"
  tenant            = "tf-as3-test"
  common_name       = "tf-as3-test.maniak.academy"
  as3tmpl           = "shttps"
  vault_pki_backend = "pki_int"
  vip_address       = "10.99.100.3"
  pki_name          = "example-dot-com"
  pool_members_port = "443"
  monitor           = "https"
  load_balancing_mode = "least-connections-member"
  pool_members      = ["10.11.5.1", "10.11.5.2", "10.11.5.3"]
  version = "1.0.0"
}
