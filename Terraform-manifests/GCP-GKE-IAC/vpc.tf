# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  project = "${var.project_name}"

  disable_on_destroy = false
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
  project = "${var.project_name}"

  disable_on_destroy = false
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  
  project = "${var.project_name}"
  name                            = "main"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

output "compute_project_service" {

  description = "Compute Project Service"
  value = google_project_service.compute.service
  
}

output "container_project_service" {

  description = "Container Project Service"
  value = google_project_service.container.service
  
}

output "gcp_Project_ID" {

  description = "GCP Project Name"
  value = var.project_name
  
}

output "gcp_Project_Number" {

  description = "GCP Project Number"
  value = var.project_number
  
}

output "VPC_NETWORK_NAME" {

  description = "The name of the VPC Network"
  value = google_compute_network.main.name
  
}
output "ROUTING_MODE" {

  description = "VPC Routing Mode"
  value = google_compute_network.main.routing_mode
  
}
output "Enable_Compute_service_API" {

  description = "Enabling The Compute service"
  value = google_project_service.compute.service
  
}
output "Enable_Container_service_API" {

  description = "Enabling Container Service API"
  value = google_project_service.container.service
  
}