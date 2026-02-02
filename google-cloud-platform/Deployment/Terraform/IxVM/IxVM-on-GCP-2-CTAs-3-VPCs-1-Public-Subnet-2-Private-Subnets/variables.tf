variable "AgentMachineType" {
	default = "c4-standard-8"
	description = "Designation for set of resources available to Agent VM"
	type = string
	validation {
		condition = contains([ "c4-standard-4", "c4-standard-8", "c4-standard-48", "c4-standard-96", "c4-standard-192" ], var.AgentMachineType)
		error_message = <<EOF
AgentMachineType must be one of the following types:
	c4-standard-4, c4-standard-8, c4-standard-48, c4-standard-96, c4-standard-192
		EOF
	}
}

variable "AgentTotalEgressBandwidthTier" {
	default = "DEFAULT"
	description = "Level of egress bandwidth tier associated with Agent VM"
	type = string
	validation {
		condition = contains([ "DEFAULT", "TIER_1" ], var.AgentTotalEgressBandwidthTier)
		error_message = <<EOF
AgentTotalEgressBandwidthTier must be one of the following values:
	DEFAULT, TIER_1
		EOF
	}
}

variable "Private1VpcNetworkMtu" {
	default = 1500
	description = "Maxium Transmission Unit associated with the first private vpc network"
	type = number
	validation {
		condition = contains([1500, 8896], var.Private1VpcNetworkMtu)
		error_message = "Private1VpcNetworkMtu must be one of (1500 | 8896) values."
	}
}

variable "Private2VpcNetworkMtu" {
	default = 1500
	description = "Maxium Transmission Unit associated with the second private vpc network"
	type = number
	validation {
		condition = contains([1500, 8896], var.Private2VpcNetworkMtu)
		error_message = "Private2VpcNetworkMtu must be one of (1500 | 8896) values."
	}
}

variable "ProjectId" {
	description = "Globally unique identifier for working project"
	type = string
}

variable "PublicFirewallRuleSourceIpRanges" {
	default = null
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
}

variable "RegionName" {
	default = "us-central1"
	description = "Geographical location where resources can be hosted" 
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

variable "ZoneName" {
	default = "us-central1-a"
	description = "Deployment area within a region"
	type = string
}