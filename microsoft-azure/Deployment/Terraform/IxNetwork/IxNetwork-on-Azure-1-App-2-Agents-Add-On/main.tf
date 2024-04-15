module "App" {
	source = "armdupre/module-ixnetwork-app/azurerm"
	version = "10.0.2"
	AdminPassword = local.AppAdminPassword
	AdminUserName = local.AppAdminUserName
	Eth0SubnetId = data.azurerm_subnet.PublicSubnet.id
	ResourceGroupLocation = data.azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = data.azurerm_resource_group.ResourceGroup.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AppVmSize
}

module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/azurerm"
	version = "10.0.3"
	Eth0SubnetId = data.azurerm_subnet.PublicSubnet.id
	Eth1SubnetId = data.azurerm_subnet.PrivateSubnet.id
	InstanceId = local.Agent1InstanceId
	ResourceGroupLocation = data.azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = data.azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AgentVmSize
	depends_on = [
		azurerm_ssh_public_key.SshKey
	]
}

module "Agent2" {
	source = "armdupre/module-ixnetwork-agent/azurerm"
	version = "10.0.3"
	Eth0IpAddress = local.Agent2Eth0IpAddress
	Eth0SubnetId = data.azurerm_subnet.PublicSubnet.id
	Eth1IpAddresses = local.Agent2Eth1IpAddresses
	Eth1SubnetId = data.azurerm_subnet.PrivateSubnet.id
	InstanceId = local.Agent2InstanceId
	ResourceGroupLocation = data.azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = data.azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AgentVmSize
	depends_on = [
		azurerm_ssh_public_key.SshKey
	]
}