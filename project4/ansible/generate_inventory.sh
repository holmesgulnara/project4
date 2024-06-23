#!/bin/bash

# Get the Terraform output
DROPLET_IPS=$(terraform output -json droplet_ips | jq -r '.[]')

# Generate the Ansible inventory file
INVENTORY_FILE="hosts.ini"
echo "[all]" > $INVENTORY_FILE
for ip in $DROPLET_IPS; do
  echo $ip >> $INVENTORY_FILE
done

echo "Ansible inventory file generated at $INVENTORY_FILE"
