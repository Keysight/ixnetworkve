locals {
	AgentVmSize = var.AgentVmSize
	Agent1InstanceId = "agent1"
	Agent2Eth0IpAddress = "10.0.10.12"
	Agent2Eth1IpAddresses = [ "10.0.2.22", "10.0.2.23", "10.0.2.24", "10.0.2.25", "10.0.2.26", "10.0.2.27", "10.0.2.28", "10.0.2.29", "10.0.2.30", "10.0.2.31" ]
	Agent2InstanceId = "agent2"
	AppAdminUserName = var.AppAdminUserName
	AppTag = "ixnetwork"
	AppVmSize = var.AppVmSize
	ClientId = var.ClientId
	ClientSecret = var.ClientSecret
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}"
	PublicSecurityRuleSourceIpPrefixes = var.PublicSecurityRuleSourceIpPrefixes == null ? [ "${data.http.ip.response_body}/32" ] : var.PublicSecurityRuleSourceIpPrefixes
	ResourceGroupLocation = var.ResourceGroupLocation
	ResourceGroupName = var.ResourceGroupName == null ? "${local.Preamble}-resource-group" : var.ResourceGroupName
	ResourceProviderRegistrations = var.ResourceProviderRegistrations
	SshKeyAlgorithm = "RSA"
	SshKeyName = "${local.Preamble}-ssh-key"
	SshKeyRsaBits = "4096"
	SubscriptionId = var.SubscriptionId
	TenantId = var.TenantId
	UserEmailTag = var.UserEmailTag == null ? data.azurerm_client_config.current.client_id : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? random_id.RandomId.id : var.UserProjectTag
}