project_id         = "engaged-kite-373111"
region             = "us-central1"
service_account    = "terraform"
vpc_name           = "main"
routing_mode       = "REGIONAL"
snet_name          = "private"
snet_ip_cidr_range = "10.0.0.0/18"
pod_range_name     = "k8s-pod-range"
service_range_name = "k8s-service-range"
router_name        = "router"
nat_name           = "nat"
cluster_name       = "portfolio"
regional_zones     = ["us-central1-a"] #["us-central1-a", "us-central1-b", "us-central1-f"]
node_name          = "portfolio-node"
machine_type       = "n2d-highmem-4" #"e2-standard-4" #"e2-standard-2" #"c2d-highcpu-4" #"e2-medium" #"e2-highcpu-2"
node_locs          = "us-central1-a" #"us-central1-b,us-central1-c"
initial_node_count = 2
min_node_count     = 2
max_node_count     = 3
node_disk          = 50
disk_type          = "pd-standard"
image_type         = "COS_CONTAINERD"
node_pools_oauth_scopes = [
  "https://www.googleapis.com/auth/logging.write",
  "https://www.googleapis.com/auth/devstorage.full_control",
  "https://www.googleapis.com/auth/cloud-platform",
  #"https://www.googleapis.com/auth/monitoring",
  # "https://www.googleapis.com/auth/servicecontrol",
  # "https://www.googleapis.com/auth/service.management.readonly",
  # "https://www.googleapis.com/auth/trace.append"
]
sing_zone = "us-central1-a"
# cred_file = ""
