output "spotfleet_id" {
  description = "The Spot Fleet request ID."
  value = "${module.spotfleet.spotfleet_id}"
}

output "spotfleet_request_state" {
  description = "The Spot Fleet request state after creation."
  value = "${module.spotfleet.spotfleet_request_state}"
}

output "ec2_ssh_key" {
  description = "The EC2 Key Pair that can be used to login to the instances."
  value = "${var.ssh_key_name}"
}
