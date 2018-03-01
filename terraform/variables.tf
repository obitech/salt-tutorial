variable name {}
variable region {}
variable access_key {}
variable secret_key {}
variable vpc {}
variable instance_type {}
variable sg_name {}
variable sg_desc {}
variable key_prefix {}

# Ubuntu related map
# Keys: count, ami, ssh_user
variable ubuntu         {
  type = "map"
}

# Amazon Linux related map
variable amazon-linux   {
  type = "map"
}

