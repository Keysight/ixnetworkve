module "Vpc" {
	source = "armdupre/module-2-vpcs-1-public-subnet-1-private-subnet/google"
	version = "10.0.0"
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
	RegionName = data.google_client_config.current.region
	Tag = local.AppTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
}