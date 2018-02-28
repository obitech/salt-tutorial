# Make sure to create the keypair first
resource "aws_key_pair" "salt_ssh" {
  key_name = "${var.key}"
  public_key = "${file("${path.root}/keys/${var.key}.pub")}"
}

# Each user has 1+ instances
resource "aws_instance" "instance-ubuntu" {
  count = "${var.ubuntu["count"] > 0 ? var.ubuntu["count"] : 0}"
  ami = "${var.ubuntu["ami"]}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key}"
  security_groups = ["${var.sg_name}"]

  provisioner "remote-exec" {
    script = "${path.module}/provision/bootstrap-ubuntu.sh"

    connection {
      type = "ssh"
      user = "${var.ubuntu["ssh_user"]}"
      private_key = "${file("${path.root}/keys/${var.key}.pem")}"
    }
  }
}

resource "aws_instance" "instance-amazon-linux" {
  count = "${var.amazon-linux["count"] > 0 ? var.amazon-linux["count"] : 0}"
  ami = "${var.amazon-linux["ami"]}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key}"
  security_groups = ["${var.sg_name}"]

  provisioner "remote-exec" {
    script = "${path.module}/provision/bootstrap-amazon-linux.sh"

    connection {
      type = "ssh"
      user = "${var.amazon-linux["ssh_user"]}"
      private_key = "${file("${path.root}/keys/${var.key}.pem")}"
    }
  }
}

