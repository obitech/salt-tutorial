## Required variables
# Name for the invocation of this module
variable name                 {}

# AWS region
variable region               {}

# AWS access key
variable access_key           {}

# AWS secret key
variable secret_key           {}

# AWS VPC ID
variable vpc                  {}

# AWS instance type
variable instance_type        {}

# Name of keypair
variable key                  {}

# Ubuntu related map
# Keys: count, ami, ssh_user
variable ubuntu               {type = "map"}

# Amazon Linux related map
# Keys: count, ami, ssh_user
variable amazon-linux         {type = "map"}

## Optional variables
# Name for security group
variable sg_name              {}
