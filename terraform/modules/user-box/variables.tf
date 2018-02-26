## Required variables
# Name for the invocation of this module
variable name           {}

# AWS region
variable region         {}

# AWS access key
variable access_key     {}

# AWS secret key
variable secret_key     {}

# AWS VPC ID
variable vpc            {}

# AWS AMI
variable ami            {}

# AWS instance type
variable instance_type  {}

# Name of keypair
variable key            {}

# Number of instances for this module invocation
variable count          {}

# Username to login to instance
variable ssh_user       {}


## Optional variables
# Name for security group
variable sg_name {
  default = "SaltTutorial"
}

# Description for security group
variable sg_description {
  default = "SSH, Salt, HTTP, HTTPS (Anywhere)"
}