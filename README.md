# ixnetworkve
IxNetwork Virtual Edition

## Ansible
Ansible scripts compatible with VMware ESXi, KVM and Openstack environments are posted under ansible folder. 
Scripts can be executed from a Linux (prior installing ansible) using the following command: 

```
    ansible-playbook create_vm_on_vmware_host.yaml
```

Scripts are expecting certain locations for the VM images (ova, qcow2) so they will have to be changed accordingly to your own setup locations. 


## OpenStack Heat Templates
    openstack stack create -t  <template name> <stack name>

Output:
```
  +---------------------+--------------------------------------+
  | Field               | Value                                |
  +---------------------+--------------------------------------+
  | id                  | 6be269ec-d22f-4cf0-bf04-df71cc6dcf75 |
  | stack_name          | Ixia_Virtual_Chassis_9.20_Heat_Template.yaml |
  | description         | No description                       |
  | creation_time       | 2022-01-12T15:58:20Z                 |
  | updated_time        | None                                 |
  | stack_status        | CREATE_IN_PROGRESS                   |
  | stack_status_reason | Stack CREATE started                 |
  +---------------------+--------------------------------------+
```
