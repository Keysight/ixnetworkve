module "Vnet" {
	source = "armdupre/module-1-vnet-1-public-subnet-2-private-subnets/azurerm"
	PublicSecurityRuleSourceIpPrefix = local.PublicSecurityRuleSourceIpPrefix
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
}

resource "azurerm_network_security_rule" "PublicRdpSecurityRule" {
	name = local.PublicRdpSecurityRuleName
	description = "Allow RDP"
	protocol = "Tcp"
	source_port_range = "*"
	destination_port_range = "3389"
	source_address_prefix = local.PublicSecurityRuleSourceIpPrefix
	destination_address_prefix = "*"
	access = "Allow"
	priority = 103
	direction = "Inbound"
	resource_group_name = azurerm_resource_group.ResourceGroup.name
	network_security_group_name = module.Vnet.PublicNetworkSecurityGroup.name
}