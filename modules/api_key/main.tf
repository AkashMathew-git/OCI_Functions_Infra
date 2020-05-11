variable "api_key_key_value" {}
variable "user_ocid" {}

resource "oci_identity_api_key" "CreateApiKey" {
    #Require
    key_value = var.api_key_key_value
    user_id = var.user_ocid
}