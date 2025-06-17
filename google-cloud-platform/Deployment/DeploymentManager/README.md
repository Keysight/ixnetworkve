## <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Google_Cloud_logo.svg/1920px-Google_Cloud_logo.svg.png" alt="GCP Logo" width="150"/> Google Cloud Platform (GCP)

### 🚀 Deployment

Version **11.00** of IxNetwork is available on the GCP Marketplace here:

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

#### 🧪 Example #1: Deploying a Demo Use Case Template with one Virtual IxNetwork VE (Client + Test Appliance) on a Single VM

**Resources Created:**
- 1x Virtual IxNetwork VE Client
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
- `machine_type`: GCP machine type (e.g., `n1-standard-4`)
- `image_family`: Image family for the VM (e.g., custom IxNetwork image)
- `image_project`: Project hosting the image
- `external_ip`: Boolean to assign an external IP
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-1-VTA-Demo-Use-Case --template GCP-1-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create GCP-1-CTA-Demo-Use-Case --template GCP-1-CTA-Demo-Use-Case.jinja
```

#### 🧪 Example #2: Deploying a Demo Use Case Template with one Virtual IxNetwork Client and two Virtual / Cloud Test Appliances

**Resources Created:**
- 1x Virtual IxNetwork VE Client
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
- `client_instance_name`: Name of the Virtual IxNetwork Client VM
- `appliance1_instance_name`: Name of the first Test Appliance VM
- `appliance2_instance_name`: Name of the second Test Appliance VM
- `machine_type`: GCP machine type (e.g., `n1-standard-4`)
- `image_family`: Image family for the VMs (e.g., custom IxNetwork image)
- `image_project`: Project hosting the image
- `external_ip`: Boolean to assign external IPs
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-2-VTA-Demo-Use-Case --template GCP-2-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create GCP-2-CTA-Demo-Use-Case --template GCP-2-CTA-Demo-Use-Case.jinja
```

#### 🧪 Example #3: Deploying a Demo Use Case Template with one Virtual / Cloud Test Appliance

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
- `machine_type`: GCP machine type (e.g., `n1-standard-4`)
- `image_family`: Image family for the VM (e.g., custom BPS image)
- `image_project`: Project hosting the image
- `external_ip`: Boolean to assign an external IP
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-1-VTA-Demo-Use-Case --template GCP-1-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create GCP-1-CTA-Demo-Use-Case --template GCP-1-CTA-Demo-Use-Case.jinja
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
- `machine_type`: GCP machine type (e.g., `n1-standard-4`)
- `image_family`: Image family for the VMs (e.g., custom BPS image)
- `image_project`: Project hosting the image
- `external_ip`: Boolean to assign external IPs
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-2-VTA-Demo-Use-Case --template GCP-2-VTA-Demo-Use-Case.jinja
```

or in case you'd like to use the **Cloud Test Appliance**: 

```bash
gcloud deployment-manager deployments create GCP-2-CTA-Demo-Use-Case --template GCP-2-CTA-Demo-Use-Case.jinja
```