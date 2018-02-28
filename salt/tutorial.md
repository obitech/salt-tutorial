# Tutorial
## Overview
- Agent(less), Masterless
    - salt, salt-ssh
    - ZeroMQ
    - PKI
- Remote execution
    - Target, module function, arguments
- Execution Modules
- States
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
    - `pkg.install`
    - Terminology
        - Formula   
        - State file
        - State
        - State Declaration
        - State Functions
- Create Top File

## Intermediate
### Folder structure
- nginx/init.sls
- nginx/install.sls
- nginx/remove.sls

### Copy files
- index.html on vagrant host
- include old state
- file.directory clean: True to /var/www/html
- file.managed to /var/www/html

### Requirements
- [Docs](https://docs.saltstack.com/en/latest/ref/states/requisites.html)

### Using Pillars
- pillar/top.sls -> default
- pillar/default.sls
    - editor, auth:user, auth:password

### Using Grains
- check grains with `grains.ls` & `grains.item pid`
- custom grains with roster: minion_opts, greeting

### Jinja
- Grains + Jinja to differentiate between OS:
```jinja
{% if grains['os_family'] == 'RedHat' %}
apache: httpd
git: git
{% elif grains['os_family'] == 'Debian' %}
apache: apache2
git: git-core
{% endif %}
```
- Use loops to setup users:
```jinja
{% for usr in ["jim", "john", "jack"] %}
...
{% endfor }
```
- Create custom index.html
    - use `grains.os`
    - use `pillar.get`
```jinja
{% set os = salt['grains.filter_by']({
    'RedHat': "I'm enterprise",
    'Debian': "No enterprise support for me"
}) %}
```