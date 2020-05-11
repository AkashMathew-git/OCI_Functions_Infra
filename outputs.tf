output "user_ocid" {
value = "${module.user_main.id}"
}

output "user_name" {
value = "${module.user_main.name}"
}

output "user_ui_password"{
value = "${module.user_main.password}"
}

output "fingerprint"{
value = "${module.api_key_main.fingerprint}"
}

output "authtoken"{
value = "${module.auth_token_main.authtoken}"
}

output "compartment_ocid"{
value = "${module.compartment_main.id}"
}

output "vcn_ocid"{
value = "${module.vcn_main.id}"
}
