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

variable "AppEth0PrivateIpAddress" {
	default = "10.0.10.10"
	type = string
}

variable "AppEth0SubnetName" {
	type = string
}

variable "AppEth0VpcNetworkName" {
	type = string
}

variable "AppId" {
	default = "app-01"
	type = string
}

variable "AppMachineType" {
	default = "n1-standard-4"
	description = "Designation for set of resources available to App VM"
	type = string
	validation {
		condition = can(regex("n1-standard-8", var.AppMachineType)) || can(regex("n1-standard-4", var.AppMachineType))
		error_message = "AppMachineType must be one of (n1-standard-8 | n1-standard-4) types."
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