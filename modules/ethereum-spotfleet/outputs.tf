output "spotfleet_id" {
  description = "The Spot Fleet request ID."
  value       = "${aws_spot_fleet_request.ethereum.id}"
}

output "spotfleet_request_state" {
  description = "The Spot Fleet request state after creation."
  value       = "${aws_spot_fleet_request.ethereum.spot_request_state}"
}

output "ec2_ssh_key" {
  description = "The EC2 Key Pair that can be used to login to the instances."
  value       = "${var.ssh_key_name}"
}
