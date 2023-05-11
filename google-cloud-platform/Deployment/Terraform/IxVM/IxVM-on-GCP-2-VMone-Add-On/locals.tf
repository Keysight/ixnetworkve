locals {
	AgentMachineType = var.AgentMachineType
	Agent2Eth0PrivateIpAddress = "10.0.10.12"
	Agent2Eth0PublicIpAddressName = "${local.AppName}-${local.Agent2Id}-eth0-ip-addr"
	Agent2Eth1PrivateIpAddress = "10.0.2.116"
	Agent2Eth1PrivateIpAliases = "/28"
	Agent2Id = "agent-02"
	Agent2InstanceName = "${local.AppName}-${local.Agent2Id}"
	AppName = "ixnetwork"
	LoginIdTag = var.LoginIdTag
	OwnerTag = var.OwnerTag
	PrivateSubnetName = var.PrivateSubnetName
	PrivateVpcNetworkName = var.PrivateVpcNetworkName
	ProjectId = var.ProjectId
	ProjectTag = var.ProjectTag
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges
	PublicSubnetName = var.PublicSubnetName
	PublicVpcNetworkName = var.PublicVpcNetworkName
	RegionName = var.RegionName
	ZoneName = var.ZoneName
}