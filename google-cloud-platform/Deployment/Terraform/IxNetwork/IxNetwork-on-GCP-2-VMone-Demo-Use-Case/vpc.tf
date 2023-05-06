module "vpc" {
	source = "../../modules/gcp-3-vpcs-1-public-subnet-2-private-subnets"
	LoginIdTag = local.LoginIdTag
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
}