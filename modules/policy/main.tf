variable "compartment_ocid" {}
variable "policy_description" {}
variable "policy_name" {}
variable "policy_statements" {}


resource "oci_identity_policy" "CreatePolicy" {
    #Required
	# depends_on = ["oci_identity_compartment.CreateCompartment", "oci_identity_user.CreateUser", "oci_identity_group.CreateGroup", "oci_identity_user_group_membership.CreateGroupMembership"]
    compartment_id = var.compartment_ocid
    description = var.policy_description
    name = var.policy_name
    statements = var.policy_statements
}