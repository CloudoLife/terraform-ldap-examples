

# Pryz/terraform-provider-ldap: LDAP provider for Terraform
# https://github.com/Pryz/terraform-provider-ldap
provider "ldap" {
    ldap_host = "localhost"
    ldap_port = 389
    use_tls = false 
    bind_user = "cn=admin,dc=<Your Domain>,dc=com"
    bind_password = "password"
}