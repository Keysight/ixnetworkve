locals {
	AgentMachineType = var.AgentMachineType
	AgentTotalEgressBandwidthTier = var.AgentTotalEgressBandwidthTier
	Agent1InstanceId = "agent1"
	Agent2Eth0PrivateIpAddress = "10.0.10.12"
	Agent2Eth0PublicIpAddressName = "${local.Preamble}-eth0-ip-addr"
	Agent2Eth1PrivateIpAddress = "10.0.3.15"
	Agent2Eth1PrivateIpAliases = "/28"
	Agent2InstanceId = "agent2"
	Agent2InstanceName = "${local.Preamble}-instance"
	AppTag = "ixnetwork"
	Preamble = replace("${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}-${local.Agent2InstanceId}", "_", "-")
	Private1VpcNetworkMtu = var.Private1VpcNetworkMtu
	Private1VpcNetworkPeerName = "${local.Preamble}-test1-vpc-peer"
	Private2VpcNetworkMtu = var.Private2VpcNetworkMtu
	Private2VpcNetworkPeerName = "${local.Preamble}-test2-vpc-peer"
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges == null ? [ "${data.http.ip.response_body}/32" ] : var.PublicFirewallRuleSourceIpRanges
	UserEmailTag = var.UserEmailTag == null ? "terraform@example.com" : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? lower(random_id.RandomId.id) : var.UserProjectTag
}