variable "group_name" {}
variable "group_description" {}
variable "compartment_ocid" {}

resource "oci_identity_group" "CreateGroup" {
  name           = var.group_name
  description    = var.group_description
  compartment_id = var.compartment_ocid
}

