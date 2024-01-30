locals {
	AgentVmSize = var.AgentVmSize
	Agent1InstanceId = "agent1"
	AppAdminPassword = var.AppAdminPassword
	AppAdminUserName = var.AppAdminUserName
	AppTag = "ixnetwork"
	AppVmSize = var.AppVmSize
	Preamble = "${local.UserLoginTag}-${local.AppTag}"
	PublicRdpSecurityRuleName = "${local.Preamble}-rdp-rule"
	PublicSecurityRuleSourceIpPrefixes = var.PublicSecurityRuleSourceIpPrefixes
	ResourceGroupLocation = var.ResourceGroupLocation
	ResourceGroupName = var.ResourceGroupName
	SshKeyAlgorithm = "RSA"
	SshKeyName = "${local.Preamble}-ssh-key"
	SshKeyRsaBits = "4096"
	SubscriptionId = var.SubscriptionId
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
}