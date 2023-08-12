variable "region" {
  description = "Region"
}

variable "project_id" {
  description = "Project"
}

variable "service_account" {
  description = "Service account"
}

variable "vpc_name" {
  description = ""
}

variable "routing_mode" {
  description = ""
}

variable "snet_name" {
  description = ""
}

variable "snet_ip_cidr_range" {
  description = ""
}

variable "pod_range_name" {
  description = ""
}

variable "service_range_name" {
  description = ""
}

variable "router_name" {
  description = ""
}

variable "nat_name" {
  description = ""
}

variable "cluster_name" {
  description = ""
}

variable "regional_zones" {
  description = ""
}

variable "node_name" {
  type        = string
  description = ""
}

variable "machine_type" {
  type        = string
  description = ""
}

variable "node_locs" {
  description = ""
}

variable "max_node_count" {
  type        = number
  description = ""
}

variable "initial_node_count" {
  type = number
}

variable "min_node_count" {
  type        = number
  description = ""
}

variable "node_disk" {
  type        = number
  description = ""
}

variable "disk_type" {
  type        = string
  description = ""
}

variable "image_type" {
  type        = string
  description = ""
}

variable "node_pools_oauth_scopes" {
  type        = list(any)
  description = ""
}

variable "sing_zone" {

}

# variable "cred_file" {
#   description = ""
# }
