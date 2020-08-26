# Terraform LDAP Examples

Examples about using Terraform LDAP Provider to manage databases and roles(users).

Github: [https://github.com/CloudoLife/terraform-ldap-examples](https://github.com/CloudoLife/terraform-ldap-examples)

## Prerequsites
Your must have a LDAP server with bind account and password, and Terraform CLI have been installed.

### LDAP Server with Bind Account and Password

Recommand use [osixia/docker-openldap: A docker image to run OpenLDAP 🐳 - https://github.com/osixia/docker-openldap](https://github.com/osixia/docker-openldap) to run OpenLDAP server within container if you want to install the LDAP Server.

Thne, remember the admin account and bind password.

### Terrraform and Terrafrom LDAP Provider

- [Terraform by HashiCorp](https://www.terraform.io/)

  Use Infrastructure as Code to provision and manage any cloud, infrastructure, or service

- [CloudoLife/terraform-provider-ldap: LDAP provider for Terraform](https://github.com/CloudoLife/terraform-provider-ldap)

  The LDAP provider gives the ability to deploy and configure resources in a LDAP server.

## Installation

First, install and config Terraform LDAP provider.

```bash
./install.sh
```

It will go get github.com/CloudoLife/terraform-provider-ldap and create or append these content to [~/.terraformrc](~/.terraformrc) file.

```shell
# ~/.terraformrc
providers {
    ldap = "${GOPATH}/bin/terraform-provider-ldap"
}
```

## Configuration

### LDAP Provider Variables

First, Specify values for LDAP Provider variables within [terraform.tfvars](./terraform.tfvars).

```terraform
ldap_host = "localhost"

ldap_port = 389

use_tls = false 

bind_user = "cn=admin,dc=<Your Domain>,dc=com"

bind_password = "password"
```

### LDAP Object

Config LDAP objects within [./objects](./objects)

```terraform
resource "ldap_object" "foo" {
    # DN must be complete (no RDN!)
    dn = "uid=foo,dc=example,dc=com"

    # classes are specified as an array
    object_classes = [
        "inetOrgPerson",
        "posixAccount",
    ]

    # attributes are specified as a set of 1-element maps
    attributes = [
        { sn              = "10" },
        { cn              = "bar" },
        { uidNumber       = "1234" },
        { gidNumber       = "1234" },
        { homeDirectory   = "/home/billy" },
        { loginShell      = "/bin/bash" },
        # when an attribute has multiple values, it must be specified multiple times
        { mail            = "billy@example.com" },
        { mail            = "admin@example.com" },
    ]
}
```

## Run

### Terraform Init

```bash
terraform init
```

It will download the Terraform LDAP Provider binary.

### Terraform apply

```bash
terraform apply
```

It will dispaly the execute plan and wait for your make yes or no.
Then yes to create LDAP roles(users) and databases.

## Import 

Import and create .tf file by run [./import.sh](./import.sh) command.

```bash
./import.sh uid=foo,dc=example,dc=com
```

It will import LDAP object(uid=foo,dc=example,dc=com) to Terraform State(terraform.tfstate) and auto create the ldap_object.foo.tf file.

You can continue to maintain that file and run terraform apply command to manage the exist LDAP objects without copying & pasting from Terraform State(terraform.tfstate).

## Inspire
Inspired by [Pryz/terraform-provider-ldap: LDAP provider for Terraform](https://github.com/Pryz/terraform-provider-ldap).

## Reference

[2] [CloudoLife/terraform-provider-ldap: LDAP provider for Terraform](https://github.com/CloudoLife/terraform-provider-ldap)

[2] [Terraform by HashiCorp - https://www.terraform.io/](https://www.terraform.io/)

[3] [Pryz/terraform-provider-ldap: LDAP provider for Terraform](https://github.com/Pryz/terraform-provider-ldap)

[4] [osixia/docker-openldap: A docker image to run OpenLDAP 🐳 - https://github.com/osixia/docker-openldap](https://github.com/osixia/docker-openldap)
