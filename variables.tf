# Required Variables
variable "name" {
  description = "The name to use for the resources in this module."
}

variable "wallet_address" {
  description = "Your Ethereum wallet address."
}

variable "fleet_size" {
  description = "The targwet number of GPUs you want to use for mining. If this value is less than the # of GPUs the instance has, those instances will not be able to start up."
  default     = "8"
}

variable "spot_price" {
  description = "The maximum amount, in USD, you're willing to spend per GPU, per hour."
  default     = "0.2"
}

variable "valid_until_date" {
  description = " The end date and time of the request, in UTC ISO8601 format (for example, YYYY-MM-DDTHH:MM:SSZ). At this point, no new Spot instance requests are placed or enabled to fulfill the request."
}

variable "email" {
  description = "Email to send alarm notifications to."
}

# Optional Variables
variable "aws_region" {
  description = "AWS region to create resources in"
  default     = "us-west-2"
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster."
}

variable "pool_host" {
  description = "The ethereum pool and port to mine on. In the format <url>:<port>."
  default     = "eth-us-west1.nanopool.org:9999"
}
