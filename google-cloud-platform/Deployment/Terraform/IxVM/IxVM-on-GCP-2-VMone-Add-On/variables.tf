variable "AgentMachineType" {
	default = "c2-standard-8"
	description = "Designation for set of resources available to Agent VM"
	type = string
	validation {
		condition = can(regex("c2-standard-16", var.AgentMachineType)) || can(regex("c2-standard-8", var.AgentMachineType)) || can(regex("c2-standard-4", var.AgentMachineType))
		error_message = "AgentMachineType must be one of (c2-standard-16 | c2-standard-8 | c2-standard-4) types."
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

variable "PrivateSubnetName" {
	type = string
}

variable "PrivateVpcNetworkName" {
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

variable "PublicSubnetName" {
	type = string
}

variable "PublicVpcNetworkName" {
	type = string
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