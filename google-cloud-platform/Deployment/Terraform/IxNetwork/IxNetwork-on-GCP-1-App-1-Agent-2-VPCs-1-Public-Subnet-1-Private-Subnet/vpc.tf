module "Vpc" {
	source = "armdupre/module-2-vpcs-1-public-subnet-1-private-subnet/google"
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
}