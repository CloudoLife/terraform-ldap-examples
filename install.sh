#!/bin/bash

set -e

go get -u github.com/CloudoLife/terraform-provider-ldap

cat >> ~/.terraformrc <<EOF
providers {
    ldap = "${GOPATH}/bin/terraform-provider-ldap"
}
EOF