variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "policy_name" {default = "FunctionPolicy"}
variable "policy_description" {default = "Policy for function users"}

variable "user_name" { default = "FunctionUser"}
variable "user_description" {default = "User to work with functions"}

variable "api_key_key_value" { default = ""}

variable "auth_token_description" {default = "Auth token for function user"}


variable "group_name" {default = "FunctionGroup"}
variable "group_description" {default = "Group for function users"}

variable "compartment_name" {default = "FunctionsCompartment"}
variable "compartment_description" {default = "Compartment for function and network related resources"}

variable "vcn_cidr_block"{ default = "10.0.0.0/16" }
variable "vcn_name"{ default = "function_vcn" }
variable "vcn_dns_label"{ default = "functionvcn" }

variable "nat_gateway_display_name"{ default = "function_nat_gw" }
variable "nat_gateway_block_traffic"{ default = false }

variable "nat_gw_cidr_block"{ default = "0.0.0.0/0" }

