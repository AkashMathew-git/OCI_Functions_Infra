output "user" {
  value = oci_identity_user.CreateUser
}

output "id" {
 value = oci_identity_user.CreateUser.id
 }
 
output "name" {
  value = oci_identity_user.CreateUser.name
}
 
output "password"{
 value = oci_identity_ui_password.CreatePassword.password
 }