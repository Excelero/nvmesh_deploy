Verifies OS matches variables from inventory, then dynamically installs correct nvmesh repo

Intended to be included in other roles.

example playbook section (whatever.yml): 

- hosts: test
  gather_facts: true
  any_errors_fatal: true
  become: true
  
  vars:
    delegate_facts_host: true
  
  tasks:
    - import_role: 
       name: pre-check
       
       
example inventory (hosts), with variables:
[test]
10.10.10.11
10.10.10.12
10.10.10.13
10.10.10.14

[test:vars]
nvmesh_repo_release=2.0
nvmesh_repo_username=excelero
nvmesh_repo_password=excelero1234
nvmesh_repo_distribution=centos
desired_distribution=CentOS
desired_distribution_version=8.2
desired_kernel=4.18.0-193.19.1.el8_2.x86_64
