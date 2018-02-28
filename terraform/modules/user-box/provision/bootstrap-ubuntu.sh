#!/usr/bin/env bash

# Update system
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y \
    -o DPkg::options::="--force-confdef" \
    -o DPkg::options::="--force-confold" \
    upgrade

# Set locales
sudo sh -c "echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale"
sudo sh -c "echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/environment"

# Install packages
sudo apt-get install -y python python3 python-pip python3-pip vim

# Grab dotfiles
curl -s -o ~/.vimrc https://raw.githubusercontent.com/obitech/dotfiles/master/.vimrc

# Install Salt via package manager
# wget --quiet -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# sudo sh -c "echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' > /etc/apt/sources.list.d/saltstack.list"
# sudo apt-get update
# sudo apt-get install salt-minion -y

# Install Salt via bootstrap script
# wget --quiet -O bootstrap-salt.sh https://bootstrap.saltstack.com
# sudo sh bootstrap-salt.sh -P
