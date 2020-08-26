#!/usr/bin/env bash


# Example:
# ./import.sh uid=foo,dc=example,dc=com

set -e

uid=$1
# echo ${uid}

# extract name from uid.
if [[ $uid =~ ^uid=([@.a-zA-Z0-9\-]+), ]]
then
  name=${BASH_REMATCH[1]}
  # echo $name
fi

tf_resource_name=ldap_object.${name}
# tf_resource_name=$2

# if [ -z ${tf_resource_name} ]
# then
#   tf_resource_name=ldap_object.${name}
# fi

# echo ${tf_resource_name}

# generate ldap_object template tf file.
cat > ${tf_resource_name}.tf <<EOF
resource "ldap_object" "${name}" {
  # (resource arguments)
}
EOF

# echo ${name}

tf_resource_name_gen=${tf_resource_name}.gen
echo ${tf_resource_name_gen}

# import ldap_object.
export TF_LDAP_IMPORTER_PATH=${tf_resource_name_gen}.tf && terraform import ${tf_resource_name} ${uid}
mv ${tf_resource_name_gen}.tf ${tf_resource_name}.tf