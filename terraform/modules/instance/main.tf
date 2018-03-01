# Make sure to create the keypair first
resource "aws_key_pair" "keypair" {
  key_name = "${var.key_name}"
  public_key = "${file("${var.public_key}")}"
}

# Each user has 1+ instances
resource "aws_instance" "instance" {
  count = "${var.count}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${var.sg_name}"]
  tags {
    Name = "${var.name}"
  }

  provisioner "remote-exec" {
    script = "${var.bootstrap_path}"
    connection {
      type = "ssh"
      user = "${var.ssh_user}"
      private_key = "${file("${var.private_key}")}"
    } 
  }
}