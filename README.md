# project4
# PROJECT 4 Prerequisites: <br>
## Create Jump Host (Bastion) <br>
## Jump Host prerequisites: <br>
## Update and Upgrade (apt-get update && apt-get upgrade -y ) <br>
## Install Ansible (apt-get install -y ansible) <br>
## Install Terrafor and dependencies:  <br>
### apt-get install -y wget unzip <br>
### Download Terraform <br>
### wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip <br>
### Unzip and move to /usr/local/bin <br>
### unzip terraform_1.8.5_linux_amd64.zip <br> <br>
### mv terraform /usr/local/bin/ <br>
### Verify installation <br>
### terraform version <br>
## Install jq (apt-get install -y jq) <br>

# TERRAFORM.TFVARS file content
### do_token         = "your_digitalocean_api_token"
### region           = "nyc1"
### size             = "s-1vcpu-1gb"
### ssh_key_ids      = [123456]  # Replace with your actual SSH key ID
### private_key_path = "/home/username/.ssh/id_rsa"  # Replace with the actual path to your private key

## TO GET SSH KEY ID:
### curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer YOUR_API_TOKEN" "https://api.digitalocean.com/v2/account/keys"

