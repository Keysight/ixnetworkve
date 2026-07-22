module "Vpc" {
	source = "git::https://github.com/Keysight/terraform-google-module-1-vpc-1-public-subnet.git?ref=26.3.0"
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
	RegionName = data.google_client_config.current.region
	Tag = local.AppTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
}
