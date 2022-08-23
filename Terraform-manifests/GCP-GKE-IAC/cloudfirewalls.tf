# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-ssh" {
  project = "${var.project_name}"
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = "${var.fw-ports}"
  }

  source_ranges = ["0.0.0.0/0"]
}

output "firewall_name" {

  description = "Google Compute Firewall Name"
  value = google_compute_firewall.allow-ssh.name
  
}

output "firewall_source_range" {

  description = "Google Compute Firewall Source Range"
  value = google_compute_firewall.allow-ssh.source_ranges
  
}

output "firewall_source_direction" {

  description = "Google Compute Firewall Direction"
  value = google_compute_firewall.allow-ssh.direction
  
}

output "firewall_source_priority" {

  description = "Google Compute Firewall Priority"
  value = google_compute_firewall.allow-ssh.priority
  
}
