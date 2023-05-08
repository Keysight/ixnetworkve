variable "LoginIdTag" {
	description = "Login ID tag of user creating the stack"
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