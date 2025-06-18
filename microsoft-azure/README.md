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

#### 🧪 Example #1: Deploying a Demo Use Case Template with one IxNetwork VE Client and one  Virtual / Cloud Test Appliance

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

#### 🧪 Example #2: Deploying a Add On Use Case Template with one IxNetwork VE Client and one Virtual / Cloud Test Appliances

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

#### 🧪 Example #3: Deploying a Demo Use Case Template with a single Virtual / Cloud Test Appliance

**Resources Created:**
- 1x Virtual / Cloud Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
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
- Firewall rules for SSH, RDP and test traffic
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