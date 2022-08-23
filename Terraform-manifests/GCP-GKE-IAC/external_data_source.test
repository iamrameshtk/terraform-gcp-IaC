data "external" "add_firewall_rules" {
    program = ["python", "scripts/firewall.py"] 
}

output "Firewall_Rule" {

    value = data.external.add_firewall_rules.result.firewall_name
  
}

output "Ports_Details" {

    value = data.external.add_firewall_rules.result.ports
  
}

output "Destination_IP_RANGE" {

    value = data.external.add_firewall_rules.result.destinationRanges
  
}

output "Traffic_Route" {

    value = data.external.add_firewall_rules.result.direction
  
}