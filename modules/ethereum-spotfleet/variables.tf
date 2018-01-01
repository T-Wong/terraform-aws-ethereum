# Required Variables
variable "name" {
  description = "The name to use for the resources in this module."
}

variable "wallet_address" {
  description = "Your Ethereum wallet address."
}

variable "fleet_role" {
  description = "The ARN of the IAM role for the SpotFleet requests."
}

variable "valid_until_date" {
  description = " The end date and time of the request, in UTC ISO8601 format (for example, YYYY-MM-DDTHH:MM:SSZ). At this point, no new Spot instance requests are placed or enabled to fulfill the request."
}

# Optional Variables
variable "fleet_size" {
  description = "The target number of GPUs you want to use for mining."
  default     = "1"
}

variable "pool_host" {
  description = "The ethereum pool and port to mine on. In the format <url>:<port>."
  default     = "eth-us-west1.nanopool.org:9999"
}

variable "spot_price" {
  description = "The maximum amount, in USD, you're willing to spend per GPU, per hour."
  default     = "0.2"
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster."
}

variable "images" {
  type = "map"

  default = {
    "us-east-1" = "ami-816b9bfb"
    "us-east-2" = "ami-7c5b7619"
    "us-west-1" = "ami-32655552"
    "us-west-2" = "ami-bce41dc4"
  }
}
