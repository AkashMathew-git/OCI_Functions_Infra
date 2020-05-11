variable "compartment_ocid" {}
variable "vcn_ocid" {}
variable "nat_gateway_block_traffic" {}
variable "nat_gateway_display_name" {}


resource "oci_core_nat_gateway" "CreateNATGateway" {
    #Required
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${var.vcn_ocid}"

    #Optional
    block_traffic = "${var.nat_gateway_block_traffic}"
    display_name = "${var.nat_gateway_display_name}"
}