variable "user_name" {}
variable "user_description" {}
variable "compartment_ocid" {}


resource "oci_identity_user" "CreateUser" {
  name           = var.user_name
  description    = var.user_description
  compartment_id = var.compartment_ocid
}

resource "oci_identity_ui_password" "CreatePassword" {
    #Required
    user_id = "${oci_identity_user.CreateUser.id}"
}