variable "ApiMaxRetries" {
	default = 1
	type = number
}

variable "AppInstanceType" {
	default = "c5n.2xlarge"
	description = "Instance type of App VM"
	type = string
	validation {
		condition = contains([	
								"c5.2xlarge",
								"c5n.2xlarge"
							], var.AppInstanceType)
		error_message = <<EOF
AppInstanceType must be one of the following types:
	t3a.xlarge, t3a.2xlarge,
	m6i.xlarge, m6i.2xlarge,
	m6a.xlarge, m6a.2xlarge,
	m6in.xlarge, m6in.2xlarge,
	m5.xlarge, m5.2xlarge,
	m5a.xlarge, m5a.2xlarge,
	m5n.xlarge, m5n.2xlarge,
	c6i.xlarge, c6i.2xlarge,
	c6a.xlarge, c6a.2xlarge,
	c6in.xlarge, c6in.2xlarge,
	c5.xlarge, c5.2xlarge,
	c5a.xlarge, c5a.2xlarge,
	c5n.xlarge, c5n.2xlarge
		EOF
	}
}

variable "InboundIPv4CidrBlocks" {
	default = null
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
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
	default = null
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = var.UserEmailTag == null ? true : length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = null
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = var.UserLoginTag == null ? true : length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = null
	description = "Project tag of user creating the deployment"
	type = string
}