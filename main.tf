# Configure the Oracle Cloud Infrastructure provider with an API Key
provider "oci" {
   tenancy_ocid = "${var.tenancy_ocid}"
   user_ocid = "${var.user_ocid}"
   fingerprint = "${var.fingerprint}"
   private_key_path = "${var.private_key_path}"
   region = "${var.region}"
}



# Create User

module "user_main"{
source = "./modules/user"
user_name = "${var.user_name}"
user_description = "${var.user_description}"
compartment_ocid = "${var.tenancy_ocid}"
}




# Create API Key

module "api_key_main"{
source = "./modules/api_key"
api_key_key_value = <<EOF
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzHhuql5Aj9RkjM0FhMo8
el//wDNkiAjH9ahU+B6Rgo7o4SNvS7WVSOTYgtZwNZIqGv6e+q2fT87bRLdYipcq
gUcAmQHxTzpjXdZk8ThK0vwNaDZF3z3B2Hsy7vUdo3zO1aqVEZ5gAgUNrDlmU+VB
ctZg9QJEX1pMJqNCT/DmabHSK0sddT5AJIvzThl8y1oQJ+3/G57CUtIrYxfOHUQ6
bZUrgCexQCiEwrD0ONMz5uWKpm6Avp0Kz/RgPHtAU1o8D9Zr6ejQdFESgyyRvvAJ
hWN0KnVTqeaOyhTbD6d0wXuaTPx3b0WP/UJn5lAKrW1gCTVmgy/LNeQoMYXVrzhQ
xQIDAQAB
-----END PUBLIC KEY-----
EOF
user_ocid = "${module.user_main.id}"
}



# Create Auth Token

module "auth_token_main"{
source = "./modules/auth_token"
auth_token_description = "${var.auth_token_description}"
user_ocid = "${module.user_main.id}"
}



# Create Group

module "group_main"{
source = "./modules/group"
group_name = "${var.group_name}"
group_description = "${var.group_description}"
compartment_ocid = "${var.tenancy_ocid}"
}




# Create Group Membership

module "group_membership_main" {
source = "./modules/group_membership"
user_ocid = "${module.user_main.id}"
group_ocid = "${module.group_main.id}"
}




# Create Compartment

module "compartment_main"{
source = "./modules/compartment"
tenancy_ocid = "${var.tenancy_ocid}"
compartment_description ="${var.compartment_description}"
compartment_name = "${var.compartment_name}"
}




# Create Policies

# Create policies for root compartment

module "policy_root_main"{
source = "./modules/policy"
compartment_ocid = "${var.tenancy_ocid}"
policy_description = "${var.policy_description}"
policy_name = "${var.policy_name}"
policy_statements = ["Allow group ${module.group_main.name} to manage repos in tenancy",
"Allow service FaaS to use virtual-network-family in compartment ${module.compartment_main.name}",
"Allow service FaaS to read repos in tenancy"]
}

# Create policies for function compartment

module "policy_compartment_main"{
source = "./modules/policy"
compartment_ocid = "${module.compartment_main.id}"
policy_description = "${var.policy_description}"
policy_name = "${var.policy_name}"
policy_statements = ["Allow group ${module.group_main.name} to manage functions-family in compartment ${module.compartment_main.name}",
"Allow group ${module.group_main.name} to read metrics in compartment ${module.compartment_main.name}",
"Allow group ${module.group_main.name} to manage virtual-network-family in compartment ${module.compartment_main.name}"]
}





# Create VCN

module "vcn_main"{
source = "./modules/vcn"
compartment_ocid = "${module.compartment_main.id}"
vcn_cidr_block = "${var.vcn_cidr_block}"
display_name = "${var.vcn_name}"
dns_label = "${var.vcn_dns_label}"
}





# Create NAT Gateway

module "nat_gw_main"{
source = "./modules/nat"
compartment_ocid = "${module.compartment_main.id}"
vcn_ocid = "${module.vcn_main.id}"
nat_gateway_block_traffic = "${var.nat_gateway_block_traffic}"
nat_gateway_display_name = "${var.nat_gateway_display_name}"
}




# Update default route table of vcn with route rule for nat gw

module "default_route_table_main"{
source = "./modules/default_route_table"
route_table_ocid = "${module.vcn_main.default_route_table_id}"
cidr_block = "${var.nat_gw_cidr_block}"
network_entity_id = "${module.nat_gw_main.id}"
}




