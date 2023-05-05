module "vpc" {
	source = "../../modules/vpc"
	LoginIdTag = local.LoginIdTag
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
}