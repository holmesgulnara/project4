variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc1"
}

variable "size" {
  description = "Droplet size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "ssh_key_ids" {
  description = "List of SSH key IDs"
  type        = list(number)
}

variable "private_key_path" {
  description = "Path to the private SSH key"
  type        = string
}
