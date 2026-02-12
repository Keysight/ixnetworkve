module "Vpc" {
	source = "git::https://github.com/Keysight/terraform-google-module-2-vpcs-1-public-subnet-1-private-subnet.git?ref=26.0.0"
	PrivateVpcNetworkMtu = local.PrivateVpcNetworkMtu
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
	RegionName = data.google_client_config.current.region
	Tag = local.AppTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
}
