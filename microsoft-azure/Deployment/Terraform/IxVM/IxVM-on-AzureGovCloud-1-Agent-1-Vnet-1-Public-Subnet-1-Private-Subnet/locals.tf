locals {
	AgentVmSize = var.AgentVmSize
	Agent1InstanceId = "agent1"
	AppTag = "ixnetwork"
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