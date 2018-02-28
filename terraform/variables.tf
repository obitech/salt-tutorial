# Sets the AWS region
variable region         {}

# AWS CLI credentials
variable access_key     {}
variable secret_key     {}

# Set your VPCs
variable vpcs           {type = "map"}

# Set your AWS instance type
variable instance_type  {}

# Name prefix for module names
variable name_prefix    {}

# Key prefix for SSH keys
variable key_prefix     {}

# Name of security group
variable sg_name        {}

# Ubuntu related map
# Keys: count, ami, ssh_user
variable ubuntu         {type = "map"}

# Amazon Linux related map
# Keys: count, ami, ssh_user
variable amazon-linux   {type = "map"}