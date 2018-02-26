provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "user_1" {
  count = "${var.count}"
  access_key = "${var.auth["access_key"]}"
  secret_key = "${var.auth["secret_key"]}"
  ami = "${var.instance["ami"]}"
  instance_type = "${var.instance["instance_type"]}"
  key_name = "${aws_key_pair.salt_ssh-1.key_name}"
  security_groups = ["${aws_security_group.SaltTutorial.name}"]

  provisioner "remote-exec" {
    script = "provision/bootstrap.sh"

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("keys/${aws_key_pair.key-1.key_name}.pem")}"
    }
  }
}

resource "aws_key_pair" "salt_ssh-1" {
  key_name = "key-1"
  public_key = "${file("keys/salt_ssh-1.pub")}"
}

output "ips_1" {
  value = "${aws_instance.user_1.*.public_ip}"
}