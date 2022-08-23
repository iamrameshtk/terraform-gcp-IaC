# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  project = "${var.project_name}"
  name    = "router"
  region  = "${var.location}"
  network = google_compute_network.main.id
}


output "compute_router_name" {

  description = "Google Compute Router Name"
  value = google_compute_router.router.name
  
}

output "compute_router_region" {

  description = "Google Compute Router Region"
  value = google_compute_router.router.region
  
}

output "compute_router_network" {

  description = "Google Compute Router Network"
  value = google_compute_router.router.network
  
}