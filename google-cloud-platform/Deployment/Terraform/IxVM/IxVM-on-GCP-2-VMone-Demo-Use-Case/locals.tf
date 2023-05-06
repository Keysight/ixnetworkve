locals {
	AgentCustomImageProjectId = var.AgentCustomImageProjectId
	AgentCustomImageFamilyName = var.AgentCustomImageFamilyName
	AgentMachineType = var.AgentMachineType
	AgentNetworkTargetTags = [
		"${local.AppName}-agent"
	]
	AgentSerialPortEnable = true
	Agent1Eth0PrivateIpAddress = "10.0.10.11"
	Agent1Eth0PublicIpAddressName = "${local.AppName}-agent-01-eth0-ip-addr"
	Agent1Eth1PrivateIpAddress = "10.0.2.15"
	Agent1Eth1PrivateIpAliases = "/28"
	Agent1InstanceName = "${local.AppName}-agent-01"
	Agent2Eth0PrivateIpAddress = "10.0.10.12"
	Agent2Eth0PublicIpAddressName = "${local.AppName}-agent-02-eth0-ip-addr"
	Agent2Eth1PrivateIpAddress = "10.0.3.15"
	Agent2Eth1PrivateIpAliases = "/28"
	Agent2InstanceName = "${local.AppName}-agent-02"
	AppName = "ixnetwork"
	LoginIdTag = var.LoginIdTag
	OwnerTag = var.OwnerTag
	ProjectId = var.ProjectId
	ProjectTag = var.ProjectTag
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges
	RegionName = var.RegionName
	ZoneName = var.ZoneName
}