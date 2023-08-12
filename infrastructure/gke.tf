module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id   #"engaged-kite-373111"
  name                       = var.cluster_name #"gke-test-1"
  region                     = var.region
  zones                      = var.regional_zones                     #["us-central1-a", "us-central1-b", "us-central1-f"]
  network                    = google_compute_network.main.name       #"default" #"vpc-01"
  subnetwork                 = google_compute_subnetwork.private.name #"default" #"us-central1-01"
  ip_range_pods              = var.pod_range_name                     #"k8s-pod-range"                        #"us-central1-01-gke-01-pods"
  ip_range_services          = var.service_range_name                 #"k8s-service-range"                    #"us-central1-01-gke-01-services"
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false

  node_pools = [
    {
      name               = "${var.node_name}"    #"default-node-pool"
      machine_type       = "${var.machine_type}" #"e2-medium"
      node_locations     = "${var.node_locs}"    #"us-central1-b,us-central1-c"
      min_count          = var.min_node_count    #1
      max_count          = var.max_node_count
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = var.node_disk       #40
      disk_type          = "${var.disk_type}"  #"pd-standard"
      image_type         = "${var.image_type}" #"COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = true
      auto_upgrade       = true
      service_account    = google_service_account.kubernetes.email #google_service_account.kubernetes.email
      preemptible        = false
      initial_node_count = var.initial_node_count
    },
  ]

  node_pools_oauth_scopes = {
    all = var.node_pools_oauth_scopes
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = var.node_name #"default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "${var.node_name}" #"default-node-pool",
    ]
  }
}
