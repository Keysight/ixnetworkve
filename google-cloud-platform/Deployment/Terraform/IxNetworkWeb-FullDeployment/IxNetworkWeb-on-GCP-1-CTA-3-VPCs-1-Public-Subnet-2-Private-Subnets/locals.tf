locals {
	AgentMachineType = var.AgentMachineType
	AgentTotalEgressBandwidthTier = var.AgentTotalEgressBandwidthTier
	Agent1InstanceId = "agent1"
	AppTag = "ixnetwork"
	Preamble = replace("${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}-${local.Agent1InstanceId}", "_", "-")
	Private1VpcNetworkMtu = var.Private1VpcNetworkMtu
	Private1VpcNetworkPeerName = "${local.Preamble}-test1-vpc-peer"
	Private2VpcNetworkMtu = var.Private2VpcNetworkMtu
	Private2VpcNetworkPeerName = "${local.Preamble}-test2-vpc-peer"
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges == null ? [ "${data.http.ip.response_body}/32" ] : var.PublicFirewallRuleSourceIpRanges
	SleepDelay = "8m"
	UserEmailTag = var.UserEmailTag == null ? "terraform@example.com" : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? lower(random_id.RandomId.id) : var.UserProjectTag
}
