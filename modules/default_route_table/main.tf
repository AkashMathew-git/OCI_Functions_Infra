variable "route_table_ocid" {}
variable "network_entity_id" {}
variable "cidr_block" {}

resource "oci_core_default_route_table" "UpdateDefaultRouteTable" {
	manage_default_resource_id = var.route_table_ocid
	route_rules {
		cidr_block = var.cidr_block
		network_entity_id = var.network_entity_id
	}
}