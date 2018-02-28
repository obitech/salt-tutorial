# Sets the AWS region
variable region         {}

# AWS CLI credentials
variable access_key     {}
variable secret_key     {}

# Set your VPCs
variable vpcs           {type = "map"}

# Set your AWS instance type
variable instance_type  {}

# AWS AMI
variable ami            {type = "map"}

# Set the number of instances you want for each user
variable count          {}

# Username to log into instance
variable ssh_user       {}

# Name prefix for module names
variable name_prefix    {}

# Key prefix for SSH keys
variable key_prefix     {}

# Name of security group
variable sg_name        {}