terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
   token = var.do_token
}

resource "digitalocean_droplet" "nodes" {
  count  = 3
  name   = "node-${count.index + 1}"
  region = var.region
  size   = var.size
  image  = "ubuntu-22-04-x64"
  ssh_keys = var.ssh_key_ids

  tags = ["rke"]
}

output "droplet_ips" {
  value = digitalocean_droplet.nodes.*.ipv4_address
}
