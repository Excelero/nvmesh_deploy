# nvmesh_deploy
Deployment Automation for NVMesh


### Configuration and Usage
This project assumes you have a basic knowledge of how Ansible works and have
already prepared your hosts for configuration by Ansible.
TBD - add pre-requisites (sshpass, ansible-galaxy collection install community.mongodb, ?)
TBD - add how to use


### Inventory

The Ansible inventory file defines the hosts in your cluster and what roles
each host plays in your Excelero cluster. The default location for an inventory
file is /etc/ansible/hosts but this file can be placed anywhere and used with
the -i flag of ansible-playbook.

```
[nvmesh-management]
mgmt1
mgmt2
mgmt3

[nvmesh-target]
target01
target02
target03

[nvmesh-client]
client01
client02
client03
```

Note: nvmesh-target nodes will be converged (client+target) 

### Playbook

You must have a playbook to pass to the ansible-playbook command when deploying your cluster. There is a sample playbook at the root of the nvmesh_deploy project called *site.yml.sample*. This playbook should work fine for most usages, but it does include by default every daemon group which might not be appropriate for your cluster setup. Perform the following steps to prepare your playbook:

Rename the sample playbook:
```
mv site.yml.sample site.yml
```

Modify the playbook as necessary for the requirements of your cluster.

BIG TBD - need to find a way to validate the configuration file is coming from the RPM and not hard coded
([KG]: for nvmesh-client, I used lineinfile instead of a jinja template (and took a backup on first modification.  It's not "elegant", but addresses this concern)
