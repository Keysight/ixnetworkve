variable "LoginIdTag" {
	type = string
}

variable "ProjectTag" {
	default = "cloud-ist"
	type = string
}

variable "PublicFirewallRuleSourceIpRanges" {
	type = list(string)
}

variable "RegionName" {
	default = "us-central1"
	type = string
}