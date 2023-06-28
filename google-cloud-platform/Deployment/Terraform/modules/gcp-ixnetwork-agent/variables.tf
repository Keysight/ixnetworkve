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

variable "AgentEth0PrivateIpAddress" {
	default = "10.0.10.11"
	type = string
}

variable "AgentEth0SubnetName" {
	type = string
}

variable "AgentEth0VpcNetworkName" {
	type = string
}

variable "AgentEth1PrivateIpAddress" {
	default = "10.0.2.15"
	type = string
}

variable "AgentEth1PrivateIpAliases" {
	default = "/28"
	type = string
}

variable "AgentEth1SubnetName" {
	type = string
}

variable "AgentEth1VpcNetworkName" {
	type = string
}

variable "AgentId" {
	default = "agent-01"
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

variable "AppName" {
	default = "ixnetwork"
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

variable "ProjectTag" {
	default = "cloud-ist"
	description = "Project tag of user creating the stack"
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