module "App" {
	source = "git::https://github.com/armdupre/terraform-azurerm-module-ixnetwork-cloud-app.git?ref=11.0.0"
	AdminUserName = local.AppAdminUserName
	Eth0SubnetId = module.Vnet.PublicSubnet.id
	Eth1SubnetId = module.Vnet.PrivateSubnet.id
	Eth2IpAddresses = local.AppEth2IpAddresses
	Eth2SubnetId = module.Vnet.PrivateSubnet.id
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AppVmSize
	depends_on = [
		azurerm_ssh_public_key.SshKey,
		module.Vnet
	]
}

resource "azurerm_resource_group" "ResourceGroup" {
	name = local.ResourceGroupName
	location = local.ResourceGroupLocation
}

resource "random_id" "RandomId" {
	byte_length = 4
}