module "salt_demo_user_1_ubuntu" {
  source = "./modules/instance"

  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  name = "${var.name}_1_ubuntu"
  instance_type = "${var.instance_type}"
  region = "${var.region}"
  count ="${var.ubuntu["count"]}" 
  ami = "${var.ubuntu["ami"]}"
  ssh_user = "${var.ubuntu["ssh_user"]}"
  key_name = "${var.key_prefix}-1"
  public_key = "${path.root}/keys/${var.key_prefix}-1.pub"
  private_key = "${path.root}/keys/${var.key_prefix}-1.pem"
  vpc = "${var.vpc}"
  sg_name = "${aws_security_group.salt_tutorial.name}"
  bootstrap_path = "${path.root}/provision/bootstrap-ubuntu.sh"
}

output "instance_id_user_1_ubuntu" {
  value = "${module.salt_demo_user_1_ubuntu.instance_id}"
}