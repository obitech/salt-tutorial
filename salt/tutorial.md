# Tutorial
## Overview
- Agent(less), Masterless
    - salt, salt-ssh
    - ZeroMQ
    - PKI
- Remote execution
    - Target, module function, arguments
- Execution Modules
- Formulas States
- Grains
- Pillar
- Top file

## Setup
- `./genkeys.sh -n $N`
- Set number of modules according to participants
- `terraform apply`
- Copy private key to vagrant folder
- `vagrant up`
- Configure master, roster, Saltfile

## Fundamentals
- Send first command
- Targeting
    - Globing
    - Target groups
- Create basic state
    - pkg.install
- Create Top File

## Intermediate
- Using Pillars
- Setup state file
- Create user
- Show require
- File management
- Using Grains
- Jinja in config file
- Setup NGINX