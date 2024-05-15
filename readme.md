# Configuration Management

I will be using ansible to configure the server.
install prometheus and grafana on the server.

## Pre Requisites
- vscode (Visual Studio Code)
- git
- github
- docker 

## Ansible

Change directory to ansible
```bash
cd ansible
```


run playbook
```bash

ansible-playbook -i inventory.txt main.yml --private-key=~/.ssh/id_rsa
```

IAC: Infrastructure as Code
go to iac repo https://github.com/fzaben993/iac.git

```bash
git submodule init
git submodule update
```
