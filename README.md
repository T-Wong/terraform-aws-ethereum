# Ethereum AWS Module

This repository contains a Terraform module which is used to deploy an Ethereum mining farm on AWS using Spot Fleet to reduce costs. Inspired by [Have Fun by Mining Ether with AWS Spot](https://medium.com/@james.s.wiggins/get-rich-quick-by-mining-ether-with-aws-spot-c7b7a3bdc149) by James Wiggins.

> Ethereum is a decentralized platform for applications that run exactly as programmed without any chance of fraud, censorship or third-party interference.

This Module includes:
* [ethereum-iam](https://github.com/T-Wong/terraform-aws-ethereum/tree/master/modules/ethereum-iam): Creates the necessary IAM policies and roles required to run Ethereum on AWS Spotfleet.
* [ethereum-spotfleet](https://github.com/T-Wong/terraform-aws-ethereum/tree/master/modules/ethereum-spotfleet): Creates an AWS Spot Fleet to run an Ethereum mining farm on.

## Types of Instances
The Spot Fleet is setup to use the following instance types when the cost per unit hour is less than or equal to the specified `spot_price`. For more information on instance weight, read [AWS' documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet.html#spot-instance-weighting).

| **Instance Type** | **# of GPUs (Weighted Capacity)** |
|-------------------|-------------------------------|
| g3.4xlarge        | 1                             |
| g3.8xlarge        | 2                             |
| g3.16xlarge       | 4                             |
| g2.2xlarge        | 1                             |
| p3.3xlarge        | 1                             |
| p3.8xlarge        | 4                             |
| p3.16xlarge       | 8                             |
| p2.xlarge         | 1                             |
| p2.8xlarge        | 8                             |
| p2.16xlarge       | 16                            |

## Supported AWS Regions
These are the regions with built in support for this module. The AMI that this module uses contains the Nvidia driver and ethminer already loaded onto it so that when pricing is advantageous, you're taking full advantage of the time.
* us-east-1
* us-east-2
* us-west-1
* us-west-2

## License & Authors
- Author:: Tyler Wong ([ty-w@live.com](mailto:ty-w@live.com))

```text
Copyright 2018, Tyler Wong

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
