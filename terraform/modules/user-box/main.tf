# We're using AWS
provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

# Make sure to create the keypair first
resource "aws_key_pair" "salt_ssh" {
  key_name = "${var.key}"
  public_key = "${file("${path.root}/keys/${var.key}.pub")}"
}

# Each user has 1+ instances
resource "aws_instance" "user" {
  count = "${var.count}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key}"
  security_groups = ["${aws_security_group.user-box.name}"]

  provisioner "remote-exec" {
    script = "${path.module}/provision/bootstrap.sh"

    connection {
      type = "ssh"
      user = "${var.ssh_user}"
      private_key = "${file("${path.root}/keys/${var.key}.pem")}"
    }
  }
}

