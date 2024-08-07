# Bastion Instance Public IP
output "BastionServer_PublicIP" {
  value = [data.oci_core_vnic.BastionServer_VNIC1.public_ip_address]
}

# LoadBalancer Public IP
output "PublicLoadBalancer" {
  value = [for ip_detail in oci_load_balancer.PublicLoadBalancer.ip_address_details : ip_detail.ip_address]
}

# WebServer1 Instance Private IP
output "Webserver1PrivateIP" { # definir la salida de la IP pública de la instancia
  value = [data.oci_core_vnic.Webserver1_VNIC1.private_ip_address] # definir la IP pública de la instancia
}

# WebServer2 Instance Private IP
output "Webserver2PrivateIP" { # definir la salida de la IP pública de la instancia
  value = [data.oci_core_vnic.Webserver2_VNIC1.private_ip_address] # definir la IP pública de la instancia
}

# Generated Private Key for WebServer Instance
output "generated_ssh_private_key" { # definir la salida de la clave privada generada para la instancia
  value     = tls_private_key.public_private_key_pair.private_key_pem # definir la clave privada generada
  sensitive = true
}
