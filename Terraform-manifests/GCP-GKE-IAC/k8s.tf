# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "primary" {
  project                  = "${var.project_name}"
  name                     = "primary"
  location                 = "europe-west2-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.main.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  networking_mode          = "VPC_NATIVE"
  

  # Optional, if you want multi-zonal cluster
  node_locations = [
    "europe-west2-b"
  ]

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    
  }

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

output "k8s_container_cluster_name" {

  description = "K8s Container cluster name"
  value = google_container_cluster.primary.name
  
}

output "k8s_container_cluster_network" {

  description = "K8s Container cluster Network"
  value = google_container_cluster.primary.network
  
}

output "k8s_container_cluster_location" {

  description = "K8s Container cluster Location"
  value = google_container_cluster.primary.location
  
}

output "k8s_container_cluster_nw_mode" {

  description = "K8s Container cluster NW Mode"
  value = google_container_cluster.primary.networking_mode
  
}

output "k8s_container_cluster_cidr" {

  description = "K8s Container cluster CIDR"
  value = google_container_cluster.primary.cluster_ipv4_cidr
  
}

output "k8s_container_cluster_services_ipv4_cidr" {

  description = "K8s Container cluster Services CIDR"
  value = google_container_cluster.primary.services_ipv4_cidr
  
}
