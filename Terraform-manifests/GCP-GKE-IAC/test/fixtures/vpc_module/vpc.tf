module "instance" {

  source  = "../../.."
  project_name = "rk-devops-infra"
  location = "europe-west2"

}

# API OUTPUTS

output "compute_project_service" {

  description = "Compute Project Service"
  value = module.instance.compute_project_service
}

output "container_project_service" {

  description = "Container Project Service"
  value = module.instance.container_project_service
  
}

# VPC OUTPUTS 

output "gcp_Project_ID"  {
    description = "GCP Project ID"
    value = module.instance.gcp_Project_ID
}

output "gcp_Project_Number"  {
    description = "GCP Project ID"
    value = module.instance.gcp_Project_Number
}

output "VPC_NETWORK_NAME" {

    description = "VPC Name"
    value = module.instance.VPC_NETWORK_NAME
}
output "ROUTING_MODE" {

    description = "Routing Mode"
    value = module.instance.ROUTING_MODE
}
output "Enable_Compute_service_API" {

    description = "Enable_Compute_service_API"
    value = module.instance.Enable_Compute_service_API
}
output "Enable_Container_service_API" {

    description = "Enable_Container_service_API"
    value = module.instance.Enable_Container_service_API
}

# NAT Outputs

output "nat_address_name" {

    description = "Google Compute NAT Address Name"
    value = module.instance.nat_address_name
  
}

output "nat_address" {

    description = "Google Compute NAT Address"
    value = module.instance.nat_address
  
}

output "nat_address_tier" {

    description = "Google Compute NAT Address Tier"
    value = module.instance.nat_address_tier
  
}

output "nat_address_region" {

    description = "Google Compute NAT Address"
    value = module.instance.nat_address_region
  
}

# Cloud Firewall

output "firewall_name" {

  description = "Google Compute Firewall Name"
  value = module.instance.firewall_name
  
}

output "firewall_source_range" {

  description = "Google Compute Firewall Source Range"
  value = module.instance.firewall_source_range
  
}

output "firewall_source_direction" {

  description = "Google Compute Firewall Direction"
  value = module.instance.firewall_source_direction
  
}

output "firewall_source_priority" {

  description = "Google Compute Firewall Priority"
  value = module.instance.firewall_source_priority
  
}

# Cloud Router Outputs

output "compute_router_name" {

  description = "Google Compute Router Name"
  value = module.instance.compute_router_name
  
}

output "compute_router_region" {

  description = "Google Compute Router Region"
  value = module.instance.compute_router_region
  
}

output "compute_router_network" {

  description = "Google Compute Router Network"
  value = module.instance.compute_router_network
  
}

# GKE Node Pool Outputs

output "google_sa_kubernetes" {

  description = "Google service account Name for Kubernetes"
  value = module.instance.google_sa_kubernetes
  
}

output "google_sa_kubernetes_dn" {

  description = "Google service account Name Display Name"
  value = module.instance.google_sa_kubernetes_dn
  
}

output "google_sa_kubernetes_email" {

  description = "Google service account email for Kubernetes"
  value = module.instance.google_sa_kubernetes_email
  
}

output "google_container_nodepool_general_name" {

  description = "Container Nodepool Name"
  value = module.instance.google_container_nodepool_general_name
  
}

output "google_container_nodepool_general_max_pods" {

  description = "Container Nodepool MaX Pods Per Node"
  value = module.instance.google_container_nodepool_general_max_pods
  
}

output "google_container_nodepool_general_node_count" {

  description = "Container Nodepool Node Count"
  value = module.instance.google_container_nodepool_general_node_count
  
}

output "google_container_nodepool_spot_name" {

  description = "Container Nodepool Name"
  value = module.instance.google_container_nodepool_spot_name
  
}

output "google_container_nodepool_spot_max_pods" {

  description = "Container Nodepool MaX Pods Per Node"
  value = module.instance.google_container_nodepool_spot_max_pods
  
}

output "google_container_nodepool_spot_node_count" {

  description = "Container Nodepool Node Count"
  value = module.instance.google_container_nodepool_spot_node_count
  
}

# K8s Outputs:

output "k8s_container_cluster_name" {

  description = "K8s Container cluster name"
  value = module.instance.k8s_container_cluster_name
  
}

output "k8s_container_cluster_network" {

  description = "K8s Container cluster Network"
  value = module.instance.k8s_container_cluster_network
  
}

output "k8s_container_cluster_location" {

  description = "K8s Container cluster Location"
  value = module.instance.k8s_container_cluster_location
  
}

output "k8s_container_cluster_nw_mode" {

  description = "K8s Container cluster NW Mode"
  value = module.instance.k8s_container_cluster_nw_mode
  
}

output "k8s_container_cluster_cidr" {

  description = "K8s Container cluster CIDR"
  value = module.instance.k8s_container_cluster_cidr
  
}

output "k8s_container_cluster_services_ipv4_cidr" {

  description = "K8s Container cluster Services CIDR"
  value = module.instance.k8s_container_cluster_services_ipv4_cidr
  
}

# SUBNETS OUTPUTS

output "compute_subnetwork_project_name" {
  
  description = "Google Compute Subnetwork Project Name"
  value = module.instance.compute_subnetwork_project_name
  
}

output "compute_subnetwork_name" {
  
  description = "Google Compute Subnetwork Name"
  value = module.instance.compute_subnetwork_name
  
}

output "compute_subnetwork_id" {
  
  description = "Google Compute Subnetwork ID"
  value = module.instance.compute_subnetwork_id
  
}

output "compute_subnetwork_google_pip_access" {
  
  description = "Google Compute Private IP Access"
  value = module.instance.compute_subnetwork_google_pip_access
  
}

output "compute_subnetwork_ip_cidr" {
  
  description = "Google Compute Subnetwork CIDR"
  value = module.instance.compute_subnetwork_ip_cidr
  
}

output "compute_subnetwork_Secondary_ip_cidr_range_name" {
  
  description = "Google Compute Subnetwork Secondary CIDR Range Name"
  value = module.instance.compute_subnetwork_Secondary_ip_cidr_range_name
    
}

output "compute_subnetwork_region" {
  
  description = "Google Compute Subnetwork Region"
  value = module.instance.compute_subnetwork_region
  
}
