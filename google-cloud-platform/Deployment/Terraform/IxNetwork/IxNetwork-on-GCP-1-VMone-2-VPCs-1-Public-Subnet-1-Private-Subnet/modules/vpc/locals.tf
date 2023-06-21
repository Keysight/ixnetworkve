locals {
	AppName = var.AppName
	ConsoleFirewallRuleName = "console-firewall-rule"
	ConsoleFirewallRuleDirection = "INGRESS"
	ConsoleFirewallRulePriority = "1001"
	ConsoleFirewallRulePorts = [
		"22"
	]
	ConsoleFirewallRuleNetworkTargetTags = [
		"${local.AppName}-app",
		"${local.AppName}-agent"
	]
	ConsoleFirewallRuleSourceIpRanges = [
		"35.190.247.0/24",
		"35.191.0.0/16",
		"64.233.160.0/19",
		"66.102.0.0/20",
		"66.249.80.0/20",
		"72.14.192.0/18",
		"74.125.0.0/16",
		"108.177.8.0/21",
		"108.177.96.0/19",
		"130.211.0.0/22",
		"172.217.0.0/19",
		"172.217.32.0/20",
		"172.217.128.0/19",
		"172.217.160.0/20",
		"172.217.192.0/19",
		"172.253.56.0/21",
		"172.253.112.0/20",
		"173.194.0.0/16",
		"209.85.128.0/17",
		"216.58.192.0/19",
		"216.239.32.0/19"
	]
	ControlFirewallRuleName = "control-firewall-rule"
	ControlFirewallRuleDirection = "INGRESS"
	ControlFirewallRulePriority = "1003"
	ControlFirewallRulePorts = "all"
	ControlFirewallRuleSourceTags = [
		"${local.AppName}-app",
		"${local.AppName}-agent"
	]
	ControlFirewallRuleTargetTags = [
		"${local.AppName}-app",
		"${local.AppName}-agent"
	]
	LoginIdTag = var.LoginIdTag
	PrivateVpcNetworkName = "test-01-vpc-network"
	PrivateSubnetName = "test-01-subnet"
	PrivateSubnetIpRange = "10.0.2.0/24"
	PrivateFirewallRuleName = "test-01-firewall-rule"
	PrivateFirewallRuleDirection = "INGRESS"
	PrivateFirewallRulePriority = "1000"
	PrivateFirewallRulePorts = "all"
	PrivateFirewallRuleSourceIpRanges = [
		"10.0.2.0/24",
		"10.0.3.0/24"
	]
	PrivateFirewallRuleSourceTags = [
		"${local.AppName}-agent"
	]
	PrivateFirewallRuleTargetTags = [
		"${local.AppName}-agent"
	]
	ProjectTag = var.ProjectTag
	PublicVpcNetworkName = "management-vpc-network"
	PublicSubnetName = "management-subnet"
	PublicSubnetIpRange = "10.0.10.0/24"
	PublicFirewallRuleName = "management-firewall-rule"
	PublicFirewallRuleDirection = "INGRESS"
	PublicFirewallRulePriority = "1000"
	PublicFirewallRulePorts = [
		"22",
		"80",
		"443",
		"3389"
	]
	PublicFirewallRuleNetworkTargetTags = [
		"${local.AppName}-app",
		"${local.AppName}-agent"
	]
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges
	RegionName = var.RegionName
}