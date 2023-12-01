variable "AgentVmSize" {
	default = "Standard_F8s_v2"
	type = string
	validation {
		condition = contains([	"Standard_F4s_v2",	"Standard_F8s_v2",	"Standard_F16s_v2"
							], var.AgentVmSize)
		error_message = <<EOF
AgentVmSize must be one of the following sizes:
	Standard_F4s_v2, Standard_F8s_v2, Standard_F16s_v2
		EOF
	}
}

variable "AppAdminPassword" {
	sensitive = true
	type = string
}

variable "AppAdminUserName" {
	default = "azure"
	type = string
}

variable "AppVmSize" {
	default = "Standard_F4s_v2"
	type = string
	validation {
		condition = contains([	"Standard_F4s_v2",	"Standard_F8s_v2"
							], var.AppVmSize)
		error_message = <<EOF
AppVmSize must be one of the following sizes:
	Standard_F4s_v2, Standard_F8s_v2
		EOF
	}
}

variable "ClientId" {
	sensitive = true
	type = string
}

variable "ClientSecret" {
	sensitive = true
	type = string
}

variable "Environment" {
	default = "usgovernment"
	description = "Azure cloud environment in which resources will be deployed"
	type = string
}

variable "PublicSecurityRuleSourceIpPrefixes" {
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
}

variable "ResourceGroupLocation" {
	default = "USGov Texas"
	type = string
}

variable "ResourceGroupName" {
	type = string
}

variable "SubscriptionId" {
	sensitive = true
	type = string
}

variable "TenantId" {
	sensitive = true
	type = string
}

variable "UserEmailTag" {
	description = "Email address tag of user creating the deployment"
	type = string
}

variable "UserLoginTag" {
	description = "Login ID tag of user creating the deployment"
	type = string
}

variable "UserProjectTag" {
	default = "cloud-ist"
	type = string
}