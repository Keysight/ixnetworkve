variable "AppName" {
	type = string
}

variable "Credentials" {
	sensitive = true
	type = string
}

variable "LoginIdTag" {
	type = string
}

variable "OwnerTag" {
	type = string
}

variable "ProjectId" {
	type = string
}

variable "ProjectTag" {
	type = string
	default = "cloud-ist"
}

variable "PublicFirewallRuleSourceIpRanges" {
	type = list(string)
}

variable "RegionName" {
	type = string
	default = "us-central1"
}

variable "ZoneName" {
	type = string
	default = "us-central1-a"
}