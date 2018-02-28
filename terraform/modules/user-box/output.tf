# Outputs IPs for each count of instance
output "ip-ubuntu" {
  value = "${aws_instance.instance-ubuntu.*.public_ip}"
}

output "ip-amazon-linux" {
  value = "${aws_instance.instance-amazon-linux.*.public_ip}"  
}