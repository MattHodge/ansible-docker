# Ansible Docker Container

A docker container with Ansible `2.5.7` installed.

Support for connecting to Windows instances over WinRM is included.

## Build the container

```bash
docker build -t matthodge/ansible:latest .
```

## Use the container

```bash
# Get the version of Ansible from inside the container
docker run --rm -ti matthodge/ansible ansible-playbook --version

# Run a playbook in the ./ansible/playbooks folder.
docker run -v $$PWD/ansible:/ansible --rm -ti matthodge/ansible ansible-playbook -i ansible/inventory.ini ansible/playbooks/ad.yaml -vvv
```
