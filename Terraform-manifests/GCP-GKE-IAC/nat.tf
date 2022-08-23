# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "nat" {
  project = "${var.project_name}"
  name   = "nat"
  router = google_compute_router.router.name
  region = "${var.location}"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "nat" {
  project = "${var.project_name}"
  region = "${var.location}"
  name         = "nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

  depends_on = [google_project_service.compute]
}


output "nat_address_name" {

    description = "Google Compute NAT Address Name"
    value = google_compute_address.nat.name
  
}

output "nat_address" {

    description = "Google Compute NAT Address"
    value = google_compute_address.nat.address
  
}

output "nat_address_tier" {

    description = "Google Compute NAT Address Tier"
    value = google_compute_address.nat.network_tier
  
}

output "nat_address_region" {

    description = "Google Compute NAT Address"
    value = google_compute_address.nat.region
  
}