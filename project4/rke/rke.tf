terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
      version = "~> 1.5.0"
    }
  }
}

resource "rke_cluster" "cluster" {
  nodes {
    address          = element(digitalocean_droplet.nodes.*.ipv4_address, 0)
    user             = "root"
    role             = ["controlplane", "etcd"]
    ssh_key          = file(var.private_key_path)
  }

  nodes {
    address          = element(digitalocean_droplet.nodes.*.ipv4_address, 1)
    user             = "root"
    role             = ["worker"]
    ssh_key          = file(var.private_key_path)
  }

  nodes {
    address          = element(digitalocean_droplet.nodes.*.ipv4_address, 2)
    user             = "root"
    role             = ["worker"]
    ssh_key          = file(var.private_key_path)
  }

  services {
    etcd {
      snapshot = true
    }
  }
}

output "kube_config" {
  value = rke_cluster.cluster.kube_config_yaml
}
