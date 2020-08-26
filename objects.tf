
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