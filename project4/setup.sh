#!/bin/bash

# Step 1: Create DigitalOcean VMs
echo "Creating DigitalOcean VMs with Terraform..."
cd terraform
terraform init
terraform apply -auto-approve