variable "user_ocid" {}
variable "group_ocid" {}

resource "oci_identity_user_group_membership" "user-group-mem1" {
  user_id        = var.user_ocid
  group_id       = var.group_ocid
}
