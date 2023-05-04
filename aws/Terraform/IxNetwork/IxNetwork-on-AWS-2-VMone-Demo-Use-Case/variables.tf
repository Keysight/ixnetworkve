variable "AgentAmiName" {
	default = "Ixia_Virtual_Test_Appliance_9.30.0.209_KVM BYOL-eaa16046-9580-4e91-8167-302d8cb0da84"
	description = "AMI name used for deploying Agent instances"
	type = string
}

variable "AgentAmiOwner" {
	default = "aws-marketplace"
	description = "Owner of AMI used for deploying Agent instances"
	type = string
}

variable "ApiMaxRetries" {
	default = 1
	type = number
}

variable "AppAmiName" {
	default = "ixnetwork-cloud-ami-9-30-2212-7-b81852f3-030c-4879-9620-67f7e2563e1f"
	description = "AMI name used for deploying App instances"
	type = string
}

variable "AppAmiOwner" {
	default = "aws-marketplace"
	description = "Owner of AMI used for deploying App instances"
	type = string
}

variable "Private1SubnetAvailabilityZone" {
	default = "us-east-1a"
	type = string
}

variable "Private2SubnetAvailabilityZone" {
	default = "us-east-1a"
	type = string
}

variable "ProjectTag" {
	default = "CLOUD_IST"
	type = string
}

variable "PublicSubnetAvailabilityZone" {
	default = "us-east-1a"
	type = string
}

variable "Region" {
	default = "us-east-1"
	type = string
}

variable "UserEmailTag" {
	type = string
	default = "aws-ixnetwork@amazon.com"
	description = "Email address tag of user creating the stack"
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	type = string
	default = "aws-ixnetwork"
	description = "Login ID tag of user creating the stack"
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "IxClientInstanceType" {
	type = string		
	default = "m5.xlarge"
	description = "Instance type of Ixia Client VM"
	validation {
		condition = can(regex("m5.xlarge", var.IxClientInstanceType)) || can(regex("t3.xlarge", var.IxClientInstanceType))
		error_message = "IxClientInstanceType must be one of (m5.xlarge | t3.xlarge) types."
	}
}

variable "IxClientSSHKey" {
	description = "Name of an existing EC2 KeyPair to enable SSH access"
	type = string
	default = "aws-ixnetwork-key-pair"
}

variable "VMoneInstanceType" {
	description = "Instance type of VMONE Appliance VM"
	type = string
	default = "c5n.xlarge"
	validation {
		condition =  can(regex("c5n.18xlarge", var.VMoneInstanceType)) || can(regex("c5n.9xlarge", var.VMoneInstanceType)) || can(regex("c5n.xlarge", var.VMoneInstanceType)) || can(regex("c5.xlarge", var.VMoneInstanceType))
		error_message = "VMoneInstanceType must be one of (c5n.18xlarge | c5n.9xlarge | c5n.xlarge | c5.xlarge) types."
	}
}

variable "InboundIPv4CidrBlock" {
	type = string
	default = "1.1.1.1/32"
	description = "IP Address /32 or IP CIDR range connecting inbound to Ixia Client"
	validation {
		condition = length(var.InboundIPv4CidrBlock) >= 9 && length(var.InboundIPv4CidrBlock) <= 18 && can(regex("(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})", var.InboundIPv4CidrBlock))
		error_message = "InboundIPv4CidrBlock must be a valid IP CIDR range of the form x.x.x.x/x."
	}
}