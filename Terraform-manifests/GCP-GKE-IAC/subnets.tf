# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "private" {
  project = "${var.project_name}"
  name                     = "private"
  ip_cidr_range            = "10.0.0.0/18"
  region                   = var.location
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

output "compute_subnetwork_project_name" {
  
  description = "Google Compute Subnetwork Project Name"
  value = google_compute_subnetwork.private.project
  
}

output "compute_subnetwork_name" {
  
  description = "Google Compute Subnetwork Name"
  value = google_compute_subnetwork.private.name
  
}

output "compute_subnetwork_id" {
  
  description = "Google Compute Subnetwork ID"
  value = google_compute_subnetwork.private.id
  
}

output "compute_subnetwork_google_pip_access" {
  
  description = "Google Compute Private IP Access"
  value = google_compute_subnetwork.private.private_ip_google_access
  
}

output "compute_subnetwork_ip_cidr" {
  
  description = "Google Compute Subnetwork CIDR"
  value = google_compute_subnetwork.private.ip_cidr_range
  
}

output "compute_subnetwork_Secondary_ip_cidr_range_name" {
  
  description = "Google Compute Subnetwork Secondary CIDR Range Name"
  value = [
    for sec_ip_range in google_compute_subnetwork.private.secondary_ip_range : sec_ip_range.range_name
  ]
    
}

output "compute_subnetwork_region" {
  
  description = "Google Compute Subnetwork Region"
  value = google_compute_subnetwork.private.region
  
}