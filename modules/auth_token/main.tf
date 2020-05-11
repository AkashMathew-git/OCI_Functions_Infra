variable "auth_token_description" {}
variable "user_ocid" {}

resource "oci_identity_auth_token" "CreateAuthToken" {
    #Required
    description = "${var.auth_token_description}"
    user_id = "${var.user_ocid}"
}
