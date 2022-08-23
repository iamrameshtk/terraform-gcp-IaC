# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
  project = "${var.project_name}"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.primary.id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = "e2-small"

    labels = {
      role = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "spot" {
  name    = "spot"
  cluster = google_container_cluster.primary.id

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    labels = {
      team = "devops"
    }

    taint {
      key    = "instance_type"
      value  = "spot"
      effect = "NO_SCHEDULE"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


output "google_sa_kubernetes" {

  description = "Google service account Name for Kubernetes"
  value = google_service_account.kubernetes.name
  
}

output "google_sa_kubernetes_dn" {

  description = "Google service account Name Display Name"
  value = google_service_account.kubernetes.display_name
  
}

output "google_sa_kubernetes_email" {

  description = "Google service account email for Kubernetes"
  value = google_service_account.kubernetes.email
  
}

output "google_container_nodepool_general_name" {

  description = "Container Nodepool Name"
  value = google_container_node_pool.general.name
  
}

output "google_container_nodepool_general_max_pods" {

  description = "Container Nodepool MaX Pods Per Node"
  value = google_container_node_pool.general.max_pods_per_node
  
}

output "google_container_nodepool_general_node_count" {

  description = "Container Nodepool Node Count"
  value = google_container_node_pool.general.node_count
  
}

output "google_container_nodepool_spot_name" {

  description = "Container Nodepool Name"
  value = google_container_node_pool.spot.name
  
}

output "google_container_nodepool_spot_max_pods" {

  description = "Container Nodepool MaX Pods Per Node"
  value = google_container_node_pool.spot.max_pods_per_node
  
}

output "google_container_nodepool_spot_node_count" {

  description = "Container Nodepool Node Count"
  value = google_container_node_pool.spot.node_count
  
}