provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "user-1" {
  source = "./modules/user-box"
  name = "${var.name_prefix}-1"
  key = "${var.key_prefix}-1"
  count = "${var.count}"
  ami = "${var.ami["ubuntu"]}"
  instance_type = "${var.instance_type}"
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  vpc = "${var.vpcs["default"]}"
  ssh_user = "${var.ssh_user}"
  sg_name = "${aws_security_group.salt_tutorial.name}"
}

module "user-2" {
  source = "./modules/user-box"
  name = "${var.name_prefix}-2"
  key = "${var.key_prefix}-2"
  count = "${var.count}"
  ami = "${var.ami["ubuntu"]}"
  instance_type = "${var.instance_type}"
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  vpc = "${var.vpcs["default"]}"
  ssh_user = "${var.ssh_user}"
  sg_name = "${aws_security_group.salt_tutorial.name}"
}