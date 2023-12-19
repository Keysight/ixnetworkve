# About IxNetwork VE Heat Templates 

## Introduction 

Welcome to the GitHub repository for Keysight IxNetwork VE deployment guide using OpenStack Heat Templates. 

To start using IxNetwork VE's Heat templates and yaml configuration, please refer the **README** files in each individual directory and decide on which template to start with from the below list.

## Prerequisites

The prerequisites are:
- IxNetwork VE Virtual Chassis, IxNetwork VE Virtual Load Module and IxNetwork VE Virtual Test Appliance qcow2 images extracted and uploaded into OpenStack Glance Server (images)
- OpenStack setup and account for running your tests
- Flavors created for the BreakingPoint VE Virtual Controller and BreakingPoint VE Virtual Blade.
  - IxNetwork VE Virtual Chassis: 4GB RAM, 2vCPUs and 8GB Disk
  - IxNetwork VE Virtual Load Module: 8GB RAM, 4 vCPUs and 2GB Disk
  - IxNetwork VE Virtual Test Appliance: 4GB RAM, 4 vCPUs and 8GB Disk
 
## Specialized knowledge
Before you deploy these templates, we recommend that you become familiar with the following notions:
- [OpenStack Flavors] https://docs.openstack.org/nova/rocky/user/flavors.html
- [OpenStack Glance Image Service] https://docs.openstack.org/glance/latest/
- [OpenStack Nova Compute Service] https://docs.openstack.org/nova/latest/
- [OpenStack Heat Templates] https://docs.openstack.org/heat/latest/
**Note:** If you are new to OpenStack, see [Getting Started with OpenStack](https://www.openstack.org/software/start/).
