output "vcn" {
  value = oci_core_virtual_network.CreateVCN
}

output "id" {
  value = oci_core_virtual_network.CreateVCN.id
}

output "default_route_table_id" {
  value = oci_core_virtual_network.CreateVCN.default_route_table_id
}