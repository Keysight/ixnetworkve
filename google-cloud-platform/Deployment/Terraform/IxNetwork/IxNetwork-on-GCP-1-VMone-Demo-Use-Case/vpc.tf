module "vpc" {
	source = "../../modules/gcp-2-vpcs-1-public-subnet-1-private-subnet"
	LoginIdTag = local.LoginIdTag
	PublicFirewallRuleSourceIpRanges = local.PublicFirewallRuleSourceIpRanges
}