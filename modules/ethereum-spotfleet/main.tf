data "aws_region" "current" {
  current = true
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"

  vars {
    wallet_address = "${var.wallet_address}"
    pool_host      = "${var.pool_host}"
  }
}

resource "aws_security_group" "ethereum" {
  name        = "${var.name}"
  description = "Allow all SSH traffic from ANY source and allows all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}"
  }
}

resource "aws_spot_fleet_request" "ethereum" {
  iam_fleet_role                      = "${var.fleet_role}"
  replace_unhealthy_instances         = true
  spot_price                          = "${var.spot_price}"
  target_capacity                     = "${var.fleet_size}"
  allocation_strategy                 = "lowestPrice"
  excess_capacity_termination_policy  = "Default"
  terminate_instances_with_expiration = true
  valid_until                         = "${var.valid_until_date}"

  launch_specification = {
    instance_type          = "g3.4xlarge"
    weighted_capacity      = 1
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "g3.8xlarge"
    weighted_capacity      = 2
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "g3.16xlarge"
    weighted_capacity      = 4
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "g2.2xlarge"
    weighted_capacity      = 1
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "p3.2xlarge"
    weighted_capacity      = 1
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "p3.8xlarge"
    weighted_capacity      = 4
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "p3.16xlarge"
    weighted_capacity      = 8
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "p2.xlarge"
    weighted_capacity      = 1
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "p2.8xlarge"
    weighted_capacity      = 8
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }

  launch_specification = {
    instance_type          = "p2.16xlarge"
    weighted_capacity      = 16
    ami                    = "${lookup(var.images, "${data.aws_region.current.name}")}"
    vpc_security_group_ids = ["${aws_security_group.ethereum.id}"]
    key_name               = "${var.ssh_key_name}"
    user_data              = "${data.template_file.user_data.rendered}"

    tags {
      Name = "${var.name}"
    }
  }
}
