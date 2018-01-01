provider "aws" {
  region = "${var.aws_region}"
}

module "iam" {
  source = "modules/ethereum-iam"

  name = "${var.name}"
}

module "spotfleet" {
  source = "modules/ethereum-spotfleet"

  name             = "${var.name}"
  wallet_address   = "${var.wallet_address}"
  fleet_role       = "${module.iam.iam_role_arn}"
  valid_until_date = "${var.valid_until_date}"
  fleet_size       = "${var.fleet_size}"
  pool_host        = "${var.pool_host}"
  spot_price       = "${var.spot_price}"
  ssh_key_name     = "${var.ssh_key_name}"
}

module "alarms" {
  source = "modules/ethereum-alarms"

  name         = "ethereum"
  spotfleet_id = "${module.spotfleet.spotfleet_id}"
  email        = "${var.email}"
}
