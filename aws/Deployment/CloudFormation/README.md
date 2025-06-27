## <img src="https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png" alt="AWS Logo" width="50"/> Amazon Web Services (AWS)

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

#### 🧪 Example #1: Deploying a Demo Use Case Template with one IxNetwork VE Client + two Virtual / Cloud Test Appliance

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

#### 🧪 Example #3: Deploying a Demo Use Case Template with a single Virtual / Cloud Test Appliance

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