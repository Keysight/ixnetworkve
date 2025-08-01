variable "AgentVmSize" {
	default = "Standard_F8s_v2"
	description = "Category, series and instance specifications associated with the Agent VM"
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
	description = "Password associated with the App VM administrator account"
	sensitive = true
	type = string
}

variable "AppAdminUserName" {
	default = "azure"
	description = "Id of the App VM administrator account"
	type = string
}

variable "AppVmSize" {
	default = "Standard_F4s_v2"
	description = "Category, series and instance specifications associated with the App VM"
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

variable "Environment" {
	default = "usgovernment"
	description = "Azure cloud environment in which resources will be deployed"
	type = string
}

variable "PublicSecurityRuleSourceIpPrefixes" {
	default = null
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
}

variable "ResourceGroupLocation" {
	default = "USGov Texas"
	description = "Location of container metadata and control plane operations"
	type = string
}

variable "ResourceGroupName" {
	default = null
	description = "Id of container that holds related resources that you want to manage together"
	type = string
}

variable "UserEmailTag" {
	default = null
	description = "Email address tag of user creating the deployment"
	type = string
}

variable "UserLoginTag" {
	default = null
	description = "Login ID tag of user creating the deployment"
	type = string
}

variable "UserProjectTag" {
	default = null
	description = "Project tag of user creating the deployment"
	type = string
}