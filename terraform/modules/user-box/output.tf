# Outputs IPs for each count of instance
output "ip" {
  value = "${aws_instance.user.*.public_ip}"
}