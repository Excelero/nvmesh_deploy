# nvmesh_deploy
Deployment Automation for NVMesh

Has been tested with CentOS 7.x and 8.x and Ansible 2.9

### Required Galaxy Collections
ansible-galaxy collection install community.mongodb community.general ansible.posix

### Configuration and Usage
This project assumes you have a basic knowledge of how Ansible works and have
already prepared your hosts for configuration by Ansible.

To use:
Clone the repository
Modify the inventory to specify hosts and roles in your cluster 
Adjust the variables in group_vars/all.yml to configure the repo.excelero.com repository
Adjust the variables in group_vars/nvmesh_client.yml and group_vars/nvmesh_target.yml to align with your hardware
Adjust and execute the playbook: ansible-playbook site.yml


### Inventory

The Ansible inventory file defines the hosts in your cluster and what roles
each host plays in your Excelero cluster. The default location for an inventory
file is /etc/ansible/hosts but this file can be placed anywhere and used with
the -i flag of ansible-playbook.

```
[nvmesh_management]
mgmt1
mgmt2
mgmt3

[nvmesh_target]
target01
target02
target03

[nvmesh_client]
client01
client02
client03
```

Note: If a node is in both nvmesh_client and nvmesh_target groups, many tasks will be automatically skipped during the Target configuration.

### Playbook

You must have a playbook to pass to the ansible-playbook command when deploying your cluster. There is a sample playbook at the root of the nvmesh_deploy project called *site.yml*. This playbook should work fine for most usages

Modify the playbook as necessary for the requirements of your cluster.

BIG TBD - need to find a way to validate the configuration file is coming from the RPM and not hard coded
([KG]: for nvmesh.conf in nvmesh-client and nvmesh-target roles, I used lineinfile instead of a jinja template and take a backup on first modification.  It's not "elegant", but addresses this concern. This is not the case for management.js.conf in the nvmesh-management role...)
