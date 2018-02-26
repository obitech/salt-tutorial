provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "nodes_a" {
  count = "1"
  ami = "${var.instance["ami"]}"
  instance_type = "${var.instance["instance_type"]}"
  key_name = "${aws_key_pair.key-1.key_name}"
  security_groups = ["${aws_security_group.SaltTutorial.name}"]

  provisioner "remote-exec" {
    script = "provision/bootstrap.sh"

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("keys/${aws_key_pair.key-1.key_name}.pem")}"
    }
  }



/*
  provisioner "file" {
    source = "keys/salt.pub"
    destination = "/tmp/salt.pub"

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("keys/${lookup(var.keys, var.region)}.pem")}"
    }
  }  

  provisioner "remote-exec" {
    script = "provision/useradd.sh"

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("keys/${lookup(var.keys, var.region)}.pem")}"
    }
  }*/
}

resource "aws_key_pair" "key-1" {
  key_name = "key-1"
  public_key = "${file("keys/key-1.pub")}"
}

output "ips_a" {
  value = "${aws_instance.nodes_a.*.public_ip}"
}