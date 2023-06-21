variable "AgentInstanceType" {
	default = "c5n.4xlarge"
	description = "Instance type of Agent VM"
	type = string
	validation {
		condition = can(regex("c5n.18xlarge", var.AgentInstanceType)) || can(regex("c5n.9xlarge", var.AgentInstanceType)) || can(regex("c5n.4xlarge", var.AgentInstanceType))
		error_message = "AgentInstanceType must be one of (c5n.18xlarge | c5n.9xlarge | c5n.4xlarge) types."
	}
}

variable "ApiMaxRetries" {
	default = 1
	type = number
}

variable "AppInstanceType" {
	default = "m5.xlarge"
	description = "Instance type of App VM"
	type = string
	validation {
		condition = can(regex("t3.xlarge", var.AppInstanceType)) || can(regex("m5.xlarge", var.AppInstanceType))
		error_message = "AppInstanceType must be one of (t3.xlarge | m5.xlarge) types."
	}
}

variable "AppSshKeyName" {
	description = "Name of an existing EC2 KeyPair to enable SSH access"
	type = string
}

variable "AwsAccessCredentialsAccessKey" {
	description = "Access key component of credentials used for programmatic calls to AWS."
	type = string
}

variable "AwsAccessCredentialsSecretKey" {
	description = "Secret access key component of credentials used for programmatic calls to AWS."
	type = string
}

variable "InboundIPv4CidrBlock" {
	type = string
	description = "IP Address /32 or IP CIDR range connecting inbound to App"
	validation {
		condition = length(var.InboundIPv4CidrBlock) >= 9 && length(var.InboundIPv4CidrBlock) <= 18 && can(regex("(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})", var.InboundIPv4CidrBlock))
		error_message = "InboundIPv4CidrBlock must be a valid IP CIDR range of the form x.x.x.x/x."
	}
}

variable "PrivateSubnetAvailabilityZone" {
	default = "us-east-1a"
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
	description = "Email address tag of user creating the deployment"
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	type = string
	description = "Login ID tag of user creating the deployment"
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "cloud-ist"
	type = string
}