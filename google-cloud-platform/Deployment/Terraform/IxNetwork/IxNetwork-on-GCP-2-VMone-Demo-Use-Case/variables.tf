variable "AgentCustomImageFamilyName" {
	default = "ixia-virtual-test-appliance-9-30-0-209"
	description = "Group of images to which Agent image belongs"
	type = string
}

variable "AgentCustomImageProjectId" {
	default = "ixvm-261016"
	description = "Globally unique identifier for Agent image source project"
	type = string
}

variable "AgentMachineType" {
	default = "c2-standard-8"
	description = "Designation for set of resources available to Agent VM"
	type = string
	validation {
		condition = can(regex("c2-standard-16", var.AgentMachineType)) || can(regex("c2-standard-8", var.AgentMachineType)) || can(regex("c2-standard-4", var.AgentMachineType))
		error_message = "AgentMachineType must be one of (c2-standard-16 | c2-standard-8 | c2-standard-4) types."
	}
}

variable "AppCustomImageFamilyName" {
	default = "ixnetwork-cloud-gcp-9-30-2212-7"
	description = "Group of images to which App image belongs"
	type = string
}

variable "AppCustomImageProjectId" {
	default = "ixvm-261016"
	description = "Globally unique identifier for App image source project"
	type = string
}

variable "AppMachineType" {
	default = "n1-standard-4"
	description = "Designation for set of resources available to Agent VM"
	type = string
	validation {
		condition = can(regex("n1-standard-8", var.AppMachineType)) || can(regex("n1-standard-4", var.AppMachineType))
		error_message = "AppMachineType must be one of (n1-standard-8 | n1-standard-4) types."
	}
}

variable "Credentials" {
	description = "Path to a service account key file in JSON format"
	sensitive = true
	type = string
}

variable "LoginIdTag" {
	description = "Login ID tag of user creating the stack"
	type = string
}

variable "OwnerTag" {
	description = "Email address tag of user creating the stack"
	type = string
}

variable "ProjectId" {
	description = "Globally unique identifier for working project"
	type = string
}

variable "ProjectTag" {
	default = "cloud-ist"
	description = "Project tag of user creating the stack"
	type = string
}

variable "PublicFirewallRuleSourceIpRanges" {
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
}

variable "RegionName" {
	default = "us-central1"
	description = "Geographical location where resources can be hosted" 
	type = string
}

variable "ZoneName" {
	default = "us-central1-a"
	description = "Deployment area within a region"
	type = string
}