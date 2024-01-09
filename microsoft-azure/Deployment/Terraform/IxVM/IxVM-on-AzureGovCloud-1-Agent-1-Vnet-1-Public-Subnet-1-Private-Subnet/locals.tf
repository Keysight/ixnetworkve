locals {
	AgentVmSize = var.AgentVmSize
	Agent1InstanceId = "agent1"
	AppTag = "ixnetwork"
	AppVersion = "9-36"
	Preamble = "${local.UserLoginTag}-${local.AppTag}-${local.AppVersion}"
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