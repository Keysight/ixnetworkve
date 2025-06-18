
# IxNetwork VE Deployment Templates

Welcome to the official GitHub repository for **Keysight IxNetwork VE Deployment Templates**.  
This repository provides deployment configurations and templates for **IxNetwork VE**, compatible with multiple cloud environments.

---

## 🖥️ Platforms

- [Amazon Web Services (AWS)](#amazon-web-services-aws)
- [Google Cloud Platform (GCP)](#google-cloud-platform-gcp)
- [Alibaba Cloud](#alibaba-cloud)
- [OpenStack](#openstack)

## <img src="https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png" alt="AWS Logo" width="50"/> Amazon Web Services (AWS)

### 🔧 Configurations

This section includes `.bpt` configuration files tailored for specific AWS instance types:

- `c5.xlarge`
- `c5n.xlarge`

### 🚀 Deployment

Version **11.00** of IxNetwork is available on the AWS Marketplace split into 3 different products:

- [Keysight IxNetwork Virtual Edition Client](https://aws.amazon.com/marketplace/pp/prodview-53hekf632ilpk?sr=0-8&ref_=beagle&applicationId=AWSMPContessa)
- [Keysight IxNetwork Virtual Test Appliance](https://aws.amazon.com/marketplace/pp/prodview-zuwqwpqngaa5q?sr=0-6&ref_=beagle&applicationId=AWSMPContessa)
- [Keysight IxNetwork Cloud Test Appliance](https://aws.amazon.com/marketplace/pp/prodview-mr4lhxlchi426?applicationId=AWSMPContessa&ref_=beagle&sr=0-14)

The IxNetwork Virtual Edition product is split between the three above VMs. Please make sure that you subscript to all of them before moving forward. 

---
#### 🔧 Prerequisites

Before you begin, ensure you have the following:
- **AWS Account**: An active AWS account with appropriate permissions.
- **IxNetwork VE License**: Ensure you have a valid license for IxNetwork Virtual Edition.
---

### 📦 CloudFormation Templates

Located in `aws/Deployment/CloudFormation/IxNetwork-FullDeployment` and `aws/Deployment/CloudFormation/IxNetwork-TestApplianceOnly`, these JSON templates are organized into:

- **Demo Use Case**: Full deployment including networking, security groups, etc.
- **Standalone Use Case**: Similar to Demo, but allows parameter customization (e.g., VPC CIDR)
- **Add-On Use Case**: Designed to integrate with existing infrastructure
---

#### 🧪 Example #1: Deploying a Demo Use Case Template with one IxNetwork VE Client and two Virtual / Cloud Test Appliance

**Resources Created:**
- 1x IxNetwork VE Client
- 2x Virtual / Cloud Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

To deploy a full IxNetwork VE environment using a CloudFormation template for Virtual Test Appliance use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-2-VTA-Demo \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-FullDeployment/AWS-2-VTA-Demo-Use-Case.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
aws cloudformation create-stack \
  --stack-name AWS-2-CTA-Demo \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-FullDeployment/AWS-2-CTA-Demo-Use-Case.json
```

---

#### 🧷 Example #2: Deploying an Add-On Use Case Template with one IxNetwork VE Client and two Virtual / Cloud Test Appliance

This adds a the IxNetwork VE Client and a Virtual / Cloud Test Appliance to an existing infrastructure (e.g., VPC, subnets).

**Resources Created:**
- 1x IxNetwork VE Client
- 2x Virtual / Cloud Test Appliance
- Firewall rules for SSH, RDP and test traffic
- External IP address (optional)

For **Virtual Test Appliance** use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-2-VTA-Add-On \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-FullDeployment/AWS-2-VTA-Add-On-Use-Case.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
aws cloudformation create-stack \
  --stack-name AWS-2-CTA-Add-On \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-FullDeployment/AWS-2-CTA-Add-On-Use-Case.json
```

#### 🧪 Example #3: Deploying a Demo Use Case Template with one Virtual / Cloud Test Appliance

**Resources Created:**
- 1x Virtual / Cloud Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

For **Virtual Test Appliance** use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-1-VTA-Demo \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-TestApplianceOnly/AWS-1-VTA-Demo-Use-Case.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
aws cloudformation create-stack \
  --stack-name AWS-1-CTA-Demo \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-TestApplianceOnly/AWS-1-CTA-Demo-Use-Case.json
```

#### 🧪 Example #4: Deploying an Add-On Use Case Template with one Virtual / Cloud Test Appliance

**Resources Created:**
- 1x Virtual / Cloud Test Appliance
- Firewall rules for SSH, RDP and test traffic
- External IP address (optional)

For **Virtual Test Appliance** use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-1-VTA-Add-On \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-TestApplianceOnly/AWS-1-VTA-Add-On-Use-Case.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
aws cloudformation create-stack \
  --stack-name AWS-1-CTA-Add-On \
  --template-body file://aws/Deployment/CloudFormation/IxNetwork-TestApplianceOnly/AWS-1-VTA-Add-On-Use-Case.json
```

### 📋 Notes
- Ensure the AWS CLI is configured with appropriate credentials and region.
- Replace file paths and parameter files with your actual paths if different.
---

### <img src="https://www.vectorlogo.zone/logos/terraformio/terraformio-icon.svg" width="30" alt="Terraform logo"> Terraform Templates

## <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Microsoft_Azure.svg/1024px-Microsoft_Azure.svg.png" alt="Azure Logo" width="150"/> Microsoft Azure

### 🔧 Configurations

This folder contains one IxNetwork VE configuration for your use cases. 

### 🚀 Deployment

Version **11.00** of IxNetwork Virtual Edition is available on the Microsoft Azure Marketplace here:

- [Keysight IxNetwork Virtual Edition Marketplace](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/keysight-technologies-ixvm.keysight-ixnetwork-virtual-edition?tab=Overview)

This product contains both the Virtual Client and Virtual / Cloud Test Appliance as part of the product subscription.
---

#### 🔧 Prerequisites

Before you begin, ensure you have the following:
- **Azure Account**: An active Azure account with appropriate permissions.
- **Azure CLI**: Installed and configured with your credentials. Install Azure CLI or Cloud Shell
- **IxNetwork VE License**: Ensure you have a valid license for IxNetwork Virtual Edition.
---

### 📦 Deployment Manager Templates

Located in `microsoft-azure/Deployment/AzureResourceManager/IxNetwork-FullDeployment` and `microsoft-azure/Deployment/AzureResourceManager/IxNetwork-TestApplianceOnly`, these ARM templates are organized into:

  - **Demo Use Case**: Full deployment including networking, security groups, etc.
  - **Add-On Use Case**: Designed to integrate with existing infrastructure
---

#### 🧪 Example #1: Deploying a Demo Use Case Template with one IxNetwork VE Client and one Virtual / Cloud Test Appliance

**Resources Created:**
- 1x IxNetwork VE Client
- 1x Virtual / Cloud Test Appliance
- A dedicated VNET network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Azure Cloud Console.
2. **Upload the Paramters and Template files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
az deployment group create --name ixnetwork-demo-01 --resource-group ixnetwork-demo-01 --template-file Azure-VTA-1-Arm_Demo_Use_Case_Template.json--parameters Azure-VTA-1-Arm_Demo_Use_Case_Parameters.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
az deployment group create --name ixnetwork-demo-01 --resource-group ixnetwork-demo-01 --template-file Azure-CTA-1-Arm_Demo_Use_Case_Template.json  --parameters Azure-CTA-1-Arm_Demo_Use_Case_Parameters.json
```

#### 🧪 Example #2: Deploying a Add On Use Case Template with one IxNetwork VE Client and one Virtual / Cloud Test Appliance

**Resources Created:**
- 1x IxNetwork VE Client
- 1x Virtual / Cloud Test Appliances
- Firewall rules for SSH, RDP and test traffic
- External IP addresses (optional)

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Azure Cloud Console.
2. **Upload the Paramters and Template files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
az deployment group create --name ixnetwork-addon-01 --resource-group ixnetwork-addon-01 --template-file Azure-VTA-1-Arm_Add-On_Use_Case_Template.json  --parameters Azure-VTA-1-Arm_Add-On_Use_Case_Parameters.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
az deployment group create --name ixnetwork-addon-01 --resource-group ixnetwork-addon-01 --template-file Azure-CTA-1-Arm_Add-On_Use_Case_Template.json  --parameters Azure-CTA-1-Arm_Add-On_Use_Case_Parameters.json
```

#### 🧪 Example #3: Deploying a Demo Use Case Template with one Virtual / Cloud Test Appliance

**Resources Created:**
- 1x Virtual / Cloud Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP address (optional)

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Azure Cloud Console.
2. **Upload the Paramters and Template files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
az deployment group create --name ixnetwork-demo-02 --resource-group ixnetwork-demo-02 --template-file Azure-VTA-1-Arm_Demo_Use_Case_Template.json --parameters Azure-VTA-1-Arm_Demo_Use_Case_Parameters.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
az deployment group create --name ixnetwork-demo-02 --resource-group ixnetwork-demo-02 --template-file Azure-CTA-1-Arm_Demo_Use_Case_Template.json  --parameters Azure-CTA-1-Arm_Demo_Use_Case_Parameters.json
```

#### 🧪 Example #4: Deploying a Add On Use Case Template with one Virtual / Cloud Test Appliances

**Resources Created:**
- 1x Virtual / Cloud Test Appliances
- Firewall rules for SSH and test traffic
- External IP addresses (optional)
---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Azure Cloud Console.
2. **Upload the Paramters and Template files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
az deployment group create --name ixnetwork-addon-02 --resource-group ixnetwork-addon-02 --template-file Azure-VTA-1-Arm_Add-On_Use_Case_Template.json  --parameters Azure-VTA-1-Arm_Add-On_Use_Case_Parameters.json
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
az deployment group create --name ixnetwork-addon-02 --resource-group ixnetwork-addon-02 --template-file Azure-CTA-1-Arm_Add-On_Use_Case_Template.json  --parameters Azure-CTA-1-Arm_Add-On_Use_Case_Parameters.json
```

## <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Google_Cloud_logo.svg/1920px-Google_Cloud_logo.svg.png" alt="GCP Logo" width="150"/> Google Cloud Platform (GCP)

### 🔧 Configurations

This folder contains several IxNetwork VE .bpt configurations that can be used on their respective instance sizes. 
We have 4 different folders: 
- C2-STANDARD-4
- C2-STANDARD-8
- C2-STANDARD-16

### 🚀 Deployment

Version **11.00** of IxNetwork Virtual Edition is available on the GCP Marketplace here:

- [Keysight IxNetwork Virtual Edition Marketplace](https://console.cloud.google.com/marketplace/product/keysight-public/keysight-ixnetwork-virtual-edition)

This product contains both the Virtual Client and Virtual / Cloud Test Appliance as part of the product subscription.
---

#### 🔧 Prerequisites

Before you begin, ensure you have the following:
- **GCP Account**: An active GCP account with appropriate permissions.
- **GCP CLI**: Installed and configured with your credentials. Install GCP CLI
- **IxNetwork VE License**: Ensure you have a valid license for IxNetwork Virtual Edition.
---

### 📦 Deployment Manager Templates

Located in `google-cloud-platform/Deployment/DeploymentManager/IxNetwork-FullDeployment` and `google-cloud-platform/Deployment/DeploymentManager/IxNetwork-TestApplianceOnly`, these JINJA templates are organized into:

  - **Demo Use Case**: Full deployment including networking, security groups, etc.
---

#### 🧪 Example #1: Deploying a Demo Use Case Template with one IxNetwork VE Client and one  Virtual / Cloud Test Appliance

**Resources Created:**
- 1x IxNetwork VE Client
- 1x Virtual / Cloud Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP address (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instance
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `instance_name`: Name of the VM instance
- `machine_type`: GCP machine type
- `external_ip`: Boolean to assign an external IP
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create 1-VTA-Demo-Use-Case --template 1-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create 1-CTA-Demo-Use-Case --template 1-CTA-Demo-Use-Case.jinja
```

#### 🧪 Example #2: Deploying a Demo Use Case Template with one IxNetwork VE Client and two Virtual / Cloud Test Appliances

**Resources Created:**
- 1x IxNetwork VE Client
- 2x Virtual / Cloud Test Appliances
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP addresses (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instances
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `client_instance_name`: Name of the IxNetwork VE Client VM
- `appliance1_instance_name`: Name of the first Test Appliance VM
- `appliance2_instance_name`: Name of the second Test Appliance VM
- `machine_type`: GCP machine type
- `external_ip`: Boolean to assign external IPs
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create 2-VTA-Demo --template 2-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create 2-CTA-Demo-Use-Case --template 2-CTA-Demo-Use-Case.jinja
```

#### 🧪 Example #3: Deploying a Demo Use Case Template with a single Virtual / Cloud Test Appliance

**Resources Created:**
- 1x Virtual / Cloud Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP address (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instance
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `instance_name`: Name of the Test Appliance VM
- `machine_type`: GCP machine type
- `external_ip`: Boolean to assign an external IP
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create 1-VTA-Demo --template 1-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create 1-CTA-Demo-Use-Case --template 1-CTA-Demo-Use-Case.jinja
```

#### 🧪 Example #4: Deploying a Demo Use Case Template with two Virtual / Cloud Test Appliances

**Resources Created:**
- 2x Virtual / Cloud Test Appliances
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP addresses (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instances
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `appliance1_instance_name`: Name of the first Test Appliance VM
- `appliance2_instance_name`: Name of the second Test Appliance VM
- `machine_type`: GCP machine type
- `external_ip`: Boolean to assign external IPs
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create 2-VTA-Demo --template 2-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create 2-CTA-Demo-Use-Case --template 2-CTA-Demo-Use-Case.jinja
```

# About IxNetwork VE Heat Templates 

## Introduction 

Welcome to the GitHub repository for Keysight IxNetwork VE deployment guide using OpenStack Heat Templates. 

To start using IxNetwork VE's Heat templates and yaml configuration, please refer the **README** files in each individual directory and decide on which template to start with from the below list.

## Prerequisites

The prerequisites are:
- IxNetwork VE Virtual / Cloud Chassis, IxNetwork VE Virtual / Cloud Load Module and IxNetwork VE Virtual / Cloud Test Appliance qcow2 images extracted and uploaded into OpenStack Glance Server (images)
- OpenStack setup and account for running your tests
- Flavors created for the Virtual / Cloud Chassis, Virtual / Cloud Test Appliance and Virtual / Cloud Load Module:
  - IxNetwork VE Virtual / Cloud Chassis: 4GB RAM, 2vCPUs and 8GB Disk
  - IxNetwork VE Virtual / Cloud Load Module: 8GB RAM, 4 vCPUs and 4GB Disk
  - IxNetwork VE Virtual / Cloud Test Appliance: 4GB RAM, 4 vCPUs and 8GB Disk
 
## Specialized knowledge
Before you deploy these templates, we recommend that you become familiar with the following notions:
- [OpenStack Flavors] https://docs.openstack.org/nova/rocky/user/flavors.html
- [OpenStack Glance Image Service] https://docs.openstack.org/glance/latest/
- [OpenStack Nova Compute Service] https://docs.openstack.org/nova/latest/
- [OpenStack Heat Templates] https://docs.openstack.org/heat/latest/
**Note:** If you are new to OpenStack, see [Getting Started with OpenStack](https://www.openstack.org/software/start/).
