#!/bin/bash

# Set locale
sudo sh -c "echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/environment"

# Update system
sudo yum update -y

# Install python3
sudo yum install python36 -y

# Grab dotfiles
curl -s -o ~/.vimrc https://raw.githubusercontent.com/obitech/dotfiles/master/.vimrc
