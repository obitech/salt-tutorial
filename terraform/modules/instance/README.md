# Terraform user-box module
This module creates:
- A custom security group with ports opened for:
    - SSH (22/tcp)
    - HTTP (80/tcp)
    - HTTPS (443/tcp)
    - Salt (4505-4506/tcp)
- A custom RSA keypair per user
- 1+ instances per user
