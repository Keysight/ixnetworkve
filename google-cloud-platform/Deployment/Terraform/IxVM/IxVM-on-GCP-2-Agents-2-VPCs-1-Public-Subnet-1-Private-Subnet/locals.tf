locals {
	AgentMachineType = var.AgentMachineType
	Agent2Eth0PrivateIpAddress = "10.0.10.12"
	Agent2Eth0PublicIpAddressName = "${local.Preamble}-eth0-ip-addr"
	Agent2Eth1PrivateIpAddress = "10.0.2.116"
	Agent2Eth1PrivateIpAliases = "/28"
	Agent2InstanceId = "agent-02"
	Agent2InstanceName = "${local.Preamble}-instance"
	AppName = "ixnetwork"
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppName}-${local.Agent2InstanceId}"
	ProjectId = var.ProjectId
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges
	RegionName = var.RegionName
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	ZoneName = var.ZoneName
}