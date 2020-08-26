
variable "ldap_host" {
  default = "localhost"

  description = "This is the LDAP host."

  type = string
}

variable "ldap_port" {
  default = "389"

  description = "This is the LDAP prot."

  type = number
}

variable "use_tls" {
  default = false

  description = "This is the LDAP use_tls."

  type = bool
}

variable "bind_user" {
  default = "cn=admin,dc=<Your Domain>,dc=com"

  description = "This is the LDAP bind user."

  type = string
}

variable "bind_password" {
  default = "password"

  description = "This is the LDAP binid password."

  type = string
}