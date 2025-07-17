locals {
	AppMachineType = var.AppMachineType
	AppTag = "ixnetwork"
	Preamble = replace("${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}", "_", "-")
	Private1VpcNetworkPeerName = "${local.Preamble}-test1-vpc-peer"
	Private2VpcNetworkPeerName = "${local.Preamble}-test2-vpc-peer"
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges == null ? [ "${data.http.ip.response_body}/32" ] : var.PublicFirewallRuleSourceIpRanges
	UserEmailTag = var.UserEmailTag == null ? data.google_client_openid_userinfo.current.email : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? lower(random_id.RandomId.id) : var.UserProjectTag
}