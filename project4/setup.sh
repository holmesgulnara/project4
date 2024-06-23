#!/bin/bash

# Step 1: Create DigitalOcean VMs
echo "Creating DigitalOcean VMs with Terraform..."
cd terraform
terraform init
terraform apply -auto-approve

# Get the IP addresses of the created VMs
DROPLET_IPS=$(terraform output -json droplet_ips | jq -r '.[]')

# Step 2:  Wait for droplets to be fully up and running
echo "Waiting for droplets to initialize..."
sleep 120  # Wait for 2 minutes
# Prepare VMs with Ansible
echo "Preparing VMs with Ansible..."
cd ../ansible

# Create Ansible inventory file
echo "[all]" > hosts.ini
for ip in $DROPLET_IPS; do
  echo $ip >> hosts.ini
done

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts.ini playbook.yml --private-key ~/.ssh/id_rsa

# # Step 3: Create RKE Cluster
# echo "Creating RKE cluster with Terraform..."
# cd ../rke

# # Replace placeholder IPs in rke.tf with actual IPs
# i=1
# for ip in $DROPLET_IPS; do
#   sed -i "s/node-${i}-ip/$ip/" rke.tf
#   i=$((i + 1))
# done

# terraform init -upgrade
# terraform apply -auto-approve

echo "SETUP COMPLETE"