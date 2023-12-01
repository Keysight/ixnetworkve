locals {
	AgentVmSize = var.AgentVmSize
	Agent1InstanceId = "agent1"
	Agent2Eth0IpAddress = "10.0.10.12"
	Agent2Eth1IpAddresses = ["10.0.2.22", "10.0.2.23", "10.0.2.24", "10.0.2.25", "10.0.2.26", "10.0.2.27", "10.0.2.28", "10.0.2.29", "10.0.2.30", "10.0.2.31"]
	Agent2InstanceId = "agent2"
	AppAdminPassword = var.AppAdminPassword
	AppAdminUserName = var.AppAdminUserName
	AppTag = "ixnetwork"
	AppVersion = "9-36"
	AppVmSize = var.AppVmSize
	Preamble = "${local.UserLoginTag}-${local.AppTag}-${local.AppVersion}"
	PrivateSubnetName = var.PrivateSubnetName
	PublicRdpSecurityRuleName = "${local.Preamble}-rdp-rule"
	PublicSecurityRuleSourceIpPrefixes = var.PublicSecurityRuleSourceIpPrefixes
	PublicSubnetName = var.PublicSubnetName
	ResourceGroupLocation = var.ResourceGroupLocation
	ResourceGroupName = var.ResourceGroupName
	SshKeyAlgorithm = "RSA"
	SshKeyName = "${local.Preamble}-ssh-key"
	SshKeyRsaBits = "4096"
	SubscriptionId = var.SubscriptionId
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	VnetName = var.VnetName
}