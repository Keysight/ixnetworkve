provider "azurerm" {
	subscription_id = var.AzureSubscriptionId
	features {}
}

locals {
	uuid = "${substr(uuid(), 1, 6)}"
	SubscriptionId = var.AzureSubscriptionId
	ResourceGroupName = var.AzureResourceGroupName
	OptionalVMPrefix = var.OptionalVMPrefix
	UserEmailTag = var.UserEmailTag
	UserProjectTag = var.UserProjectTag
	UserOptionsTag = var.UserOptionsTag
	ImageResourceGroupName = var.ImageResourceGroupName
	PageBlobsStorageAccountName = var.PageBlobsStorageAccountName
	DiagnosticsStorageAccountName = var.DiagnosticsStorageAccountName
	VnetName = "${local.OptionalVMPrefix}_IXIA_AZURE_VNET"
	VnetAddressPrefix = "10.0.0.0/16"
	MgmtSubnetName = "${local.OptionalVMPrefix}_IXIA_AZURE_VNET_MGMT_SUBNET"
	MgmtSubnetPrefix = "10.0.10.0/24"
	Test1SubnetName = "${local.OptionalVMPrefix}_IXIA_AZURE_VNET_TEST1_SUBNET"
	Test1SubnetPrefix = "10.0.2.0/24"
	Test2SubnetName = "${local.OptionalVMPrefix}_IXIA_AZURE_VNET_TEST2_SUBNET"
	Test2SubnetPrefix = "10.0.3.0/24"
	MgmtNetworkSecurityGroupName = "${local.OptionalVMPrefix}_IXIA_AZURE_NETWORK_SECURITY_GROUP"
	Test1NetworkSecurityGroupName = "${local.OptionalVMPrefix}_IXIA_AZURE_TEST1_NETWORK_SECURITY_GROUP"
	Test2NetworkSecurityGroupName = "${local.OptionalVMPrefix}_IXIA_AZURE_TEST2_NETWORK_SECURITY_GROUP"
	MgmtSshSecurityRuleName = "${local.OptionalVMPrefix}_IXIA_AZURE_SSH_RULE"
	MgmtHttpSecurityRuleName = "${local.OptionalVMPrefix}_IXIA_AZURE_WEB_RULE"
	MgmtHttpsSecurityRuleName = "${local.OptionalVMPrefix}_IXIA_AZURE_HTTPS_RULE"
	MgmtRdpSecurityRuleName = "${local.OptionalVMPrefix}_IXIA_AZURE_RDP_RULE"
	MgmtSecurityRuleSourceIpPrefix = var.MgmtSecurityRuleSourceIpPrefix
	IxiaClientEth0Name = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_CLIENT_ETH0"
	VirtualTestAppliance1Eth0Name = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_VIRTUALTESTAPPLIANCE1_ETH0"
	VirtualTestAppliance1Eth1Name = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_VIRTUALTESTAPPLIANCE1_ETH1"
	VirtualTestAppliance2Eth0Name = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_VIRTUALTESTAPPLIANCE2_ETH0"
	VirtualTestAppliance2Eth1Name = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_VIRTUALTESTAPPLIANCE2_ETH1"
	VirtualTestAppliance1Eth0IpAddress = "10.0.10.11"
	VirtualTestAppliance1Eth1IpAddresses = ["10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21"]
	VirtualTestAppliance2Eth0IpAddress = "10.0.10.12"
	VirtualTestAppliance2Eth1IpAddresses = ["10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21"]
	IxiaClientName = "${local.OptionalVMPrefix}-IXIA-AZURE-IXLOAD-CLIENT"
	IxiaClientDnsLabel = join("", [lower(replace(local.ResourceGroupName, "_", "-")), "-", "ixia-ixload-client", "-", local.uuid])
	IxiaClientEnableAcceleratedNetworking = "false"
	IxiaClientEnableIPForwarding = "false"
	IxiaClientBootDiagnosticsEnabled = "true"
	IxiaClientVmSize = var.IxiaClientVmSize
	IxiaClientDiskSizeGB = "127"
	VirtualTestAppliance1Name = "${local.OptionalVMPrefix}-IXIA-AZURE-IXLOAD-VIRTUALTESTAPPLIANCE1"
	VirtualTestAppliance1DnsLabel = join("", [lower(replace(local.ResourceGroupName, "_", "-")), "-", "ixia-ixload-vmone-1", "-", local.uuid])
	VirtualTestAppliance2Name = "${local.OptionalVMPrefix}-IXIA-AZURE-IXLOAD-VIRTUALTESTAPPLIANCE2"
	VirtualTestAppliance2DnsLabel = join("", [lower(replace(local.ResourceGroupName, "_", "-")), "-", "ixia-ixload-vmone-2", "-", local.uuid])
	VirtualTestApplianceEnableAcceleratedNetworking = "true"
	VirtualTestApplianceEnableIPForwarding = "true"
	VirtualTestApplianceDisablePasswordAuthentication = "true"
	VirtualTestApplianceProvisionVMAgent = "false"
	VirtualTestApplianceBootDiagnosticsEnabled = "true"
	VirtualTestApplianceVmSize = var.VirtualTestApplianceVmSize
	VirtualTestApplianceDiskSizeGB = "14"
	MgmtPublicIpAddressName = "${local.OptionalVMPrefix}_IXIA_AZURE_MGMT_PUBLIC_IP"
	VirtualTestAppliance1Eth0PublicIpAddressName = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_VIRTUALTESTAPPLIANCE1_ETH0_PUBLIC_IP"
	VirtualTestAppliance2Eth0PublicIpAddressName = "${local.OptionalVMPrefix}_IXIA_AZURE_IXLOAD_VIRTUALTESTAPPLIANCE2_ETH0_PUBLIC_IP"
	IxiaClientPageBlobName = var.IxiaClientPageBlobName
	IxiaClientPageBlobPath = "/ixloadve910/${local.IxiaClientPageBlobName}"
	IxiaClientCreateOption = "Attach"
	VirtualTestApplianceImageName = var.VirtualTestApplianceImageName
	VirtualTestApplianceImageId = "/subscriptions/${local.SubscriptionId}/resourceGroups/${local.ImageResourceGroupName}/providers/Microsoft.Compute/images/${local.VirtualTestApplianceImageName}"
	VirtualTestApplianceCreateOption = "FromImage"
	AdminUserName = "Ixia-Admin"
	SshPublicKeyData = "ssh-rsa"
	SshKeyPath = "/home/${local.AdminUserName}/.ssh/authorized_keys"
}

resource "azurerm_resource_group" "example" {
  name = local.ResourceGroupName
  location = "East US 2"
}

resource "azurerm_virtual_network" "Vnet" {
	name = local.VnetName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	address_space = [ local.VnetAddressPrefix ]
}

resource "azurerm_subnet" "MgmtSubnet" {
	name = local.MgmtSubnetName
	resource_group_name = azurerm_resource_group.example.name
	virtual_network_name = azurerm_virtual_network.Vnet.name
	address_prefixes = [ local.MgmtSubnetPrefix ]
	depends_on = [
		azurerm_virtual_network.Vnet
	]
}

resource "azurerm_subnet" "Test1Subnet" {
	name = local.Test1SubnetName
	resource_group_name = azurerm_resource_group.example.name
	virtual_network_name = azurerm_virtual_network.Vnet.name
	address_prefixes = [ local.Test1SubnetPrefix ]
	depends_on = [
		azurerm_virtual_network.Vnet
	]
}

resource "azurerm_subnet" "Test2Subnet" {
	name = local.Test2SubnetName
	resource_group_name = azurerm_resource_group.example.name
	virtual_network_name = azurerm_virtual_network.Vnet.name
	address_prefixes = [ local.Test2SubnetPrefix ]
	depends_on = [
		azurerm_virtual_network.Vnet
	]
}

resource "azurerm_network_security_group" "MgmtNetworkSecurityGroup" {
	name = local.MgmtNetworkSecurityGroupName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	security_rule {
		name = local.MgmtHttpsSecurityRuleName
		description = "Allow HTTPS"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "443"
		source_address_prefix = local.MgmtSecurityRuleSourceIpPrefix
		destination_address_prefix = "*"
		access = "Allow"
		priority = 100
		direction = "Inbound"
		source_address_prefixes = []
		destination_address_prefixes = []
	}
	security_rule {
		name = local.MgmtSshSecurityRuleName
		description = "Allow SSH"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "22"
		source_address_prefix = local.MgmtSecurityRuleSourceIpPrefix
		destination_address_prefix = "*"
		access = "Allow"
		priority = 101
		direction = "Inbound"
		source_address_prefixes = []
		destination_address_prefixes = []
	}
	security_rule {
		name = local.MgmtHttpSecurityRuleName
		description = "Allow HTTP"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "80"
		source_address_prefix = local.MgmtSecurityRuleSourceIpPrefix
		destination_address_prefix = "*"
		access = "Allow"
		priority = 102
		direction = "Inbound"
		source_address_prefixes = []
		destination_address_prefixes = []
	}
	security_rule {
		name = local.MgmtRdpSecurityRuleName
		description = "Allow RDP"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "3389"
		source_address_prefix = local.MgmtSecurityRuleSourceIpPrefix
		destination_address_prefix = "*"
		access = "Allow"
		priority = 103
		direction = "Inbound"
		source_address_prefixes = []
		destination_address_prefixes = []
	}
} 

resource "azurerm_subnet_network_security_group_association" "MgmtNetworkSecurityGroup" {
	subnet_id = azurerm_subnet.MgmtSubnet.id
	network_security_group_id = azurerm_network_security_group.MgmtNetworkSecurityGroup.id
}

resource "azurerm_network_security_group" "Test1NetworkSecurityGroup" {
	name = local.Test1NetworkSecurityGroupName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	security_rule {
		name = local.MgmtHttpSecurityRuleName
		description = "Allow HTTP"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "80"
		source_address_prefix = local.MgmtSecurityRuleSourceIpPrefix
		destination_address_prefix = "*"
		access = "Allow"
		priority = 102
		direction = "Inbound"
		source_address_prefixes = []
		destination_address_prefixes = []
	}
}

resource "azurerm_subnet_network_security_group_association" "Test1NetworkSecurityGroup" {
	subnet_id = azurerm_subnet.Test1Subnet.id
	network_security_group_id = azurerm_network_security_group.Test1NetworkSecurityGroup.id
}

resource "azurerm_network_security_group" "Test2NetworkSecurityGroup" {
	name = local.Test2NetworkSecurityGroupName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	security_rule {
		name = local.MgmtHttpSecurityRuleName
		description = "Allow HTTP"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "80"
		source_address_prefix = local.MgmtSecurityRuleSourceIpPrefix
		destination_address_prefix = "*"
		access = "Allow"
		priority = 102
		direction = "Inbound"
		source_address_prefixes = []
		destination_address_prefixes = []
	}
}

resource "azurerm_subnet_network_security_group_association" "Test2NetworkSecurityGroup" {
	subnet_id = azurerm_subnet.Test2Subnet.id
	network_security_group_id = azurerm_network_security_group.Test2NetworkSecurityGroup.id
}

resource "azurerm_network_interface" "IxiaClientEth0" {
	name = local.IxiaClientEth0Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_configuration {
		name = "ipconfig1"
		private_ip_address_allocation = "Dynamic"
		public_ip_address_id = azurerm_public_ip.MgmtPublicIpAddress.id
		subnet_id = azurerm_subnet.MgmtSubnet.id
		primary = "true"
		private_ip_address_version = "IPv4"
	}
	dns_servers = []
	enable_accelerated_networking = local.IxiaClientEnableAcceleratedNetworking
	enable_ip_forwarding = local.IxiaClientEnableIPForwarding
	depends_on = [
		azurerm_subnet.MgmtSubnet,
		azurerm_network_security_group.MgmtNetworkSecurityGroup,
		azurerm_public_ip.MgmtPublicIpAddress
	]
}

resource "azurerm_network_interface" "VirtualTestAppliance1Eth0" {
	name = local.VirtualTestAppliance1Eth0Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_configuration {
		name = "ipconfig1"
		private_ip_address = local.VirtualTestAppliance1Eth0IpAddress
		private_ip_address_allocation = "Static"
		public_ip_address_id = azurerm_public_ip.VirtualTestAppliance1Eth0PublicIpAddress.id
		subnet_id = azurerm_subnet.MgmtSubnet.id
		primary = "true"
		private_ip_address_version = "IPv4"
	}
	dns_servers = []
	enable_accelerated_networking = local.VirtualTestApplianceEnableAcceleratedNetworking
	enable_ip_forwarding = local.VirtualTestApplianceEnableIPForwarding
	depends_on = [
		azurerm_subnet.MgmtSubnet,
		azurerm_network_security_group.MgmtNetworkSecurityGroup,
		azurerm_public_ip.VirtualTestAppliance1Eth0PublicIpAddress
	]
}
 
resource "azurerm_network_interface" "VirtualTestAppliance1Eth1" {
	name = local.VirtualTestAppliance1Eth1Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_configuration {
		name = "ipconfig1"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[0]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "true"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig2"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[1]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig3"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[2]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig4"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[3]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig5"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[4]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig6"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[5]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig7"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[6]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig8"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[7]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig9"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[8]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfigA"
		private_ip_address = local.VirtualTestAppliance1Eth1IpAddresses[9]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test1Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	dns_servers = []
	enable_accelerated_networking = local.VirtualTestApplianceEnableAcceleratedNetworking
	enable_ip_forwarding = local.VirtualTestApplianceEnableIPForwarding
	depends_on = [
		azurerm_subnet.Test1Subnet,
		azurerm_network_security_group.Test1NetworkSecurityGroup
	]
}
 
resource "azurerm_network_interface" "VirtualTestAppliance2Eth0" {
	name = local.VirtualTestAppliance2Eth0Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_configuration {
		name = "ipconfig1"
		private_ip_address = local.VirtualTestAppliance2Eth0IpAddress
		private_ip_address_allocation = "Static"
		public_ip_address_id = azurerm_public_ip.VirtualTestAppliance2Eth0PublicIpAddress.id
		subnet_id = azurerm_subnet.MgmtSubnet.id
		primary = "true"
		private_ip_address_version = "IPv4"
	}
	dns_servers = []
	enable_accelerated_networking = local.VirtualTestApplianceEnableAcceleratedNetworking
	enable_ip_forwarding = local.VirtualTestApplianceEnableIPForwarding
	depends_on = [
		azurerm_subnet.MgmtSubnet,
		azurerm_network_security_group.MgmtNetworkSecurityGroup,
		azurerm_public_ip.VirtualTestAppliance2Eth0PublicIpAddress
	]
}

resource "azurerm_network_interface" "VirtualTestAppliance2Eth1" {
	name = local.VirtualTestAppliance2Eth1Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_configuration {
		name = "ipconfig1"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[0]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "true"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig2"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[1]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig3"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[2]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig4"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[3]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig5"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[4]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig6"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[5]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig7"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[6]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig8"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[7]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfig9"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[8]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	ip_configuration {
		name = "ipconfigA"
		private_ip_address = local.VirtualTestAppliance2Eth1IpAddresses[9]
		private_ip_address_allocation = "Static"
		subnet_id = azurerm_subnet.Test2Subnet.id
		primary = "false"
		private_ip_address_version = "IPv4"
	}
	dns_servers = []
	enable_accelerated_networking = local.VirtualTestApplianceEnableAcceleratedNetworking
	enable_ip_forwarding = local.VirtualTestApplianceEnableIPForwarding
	depends_on = [
		azurerm_subnet.Test2Subnet,
		azurerm_network_security_group.Test2NetworkSecurityGroup
	]
}

resource "azurerm_public_ip" "MgmtPublicIpAddress" {
	name = local.MgmtPublicIpAddressName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_version = "IPv4"
	allocation_method = "Dynamic"
	idle_timeout_in_minutes = 4
	domain_name_label = local.IxiaClientDnsLabel
}

resource "azurerm_public_ip" "VirtualTestAppliance1Eth0PublicIpAddress" {
	name = local.VirtualTestAppliance1Eth0PublicIpAddressName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_version = "IPv4"
	allocation_method = "Dynamic"
	idle_timeout_in_minutes = 4
	domain_name_label = local.VirtualTestAppliance1DnsLabel
}

resource "azurerm_public_ip" "VirtualTestAppliance2Eth0PublicIpAddress" {
	name = local.VirtualTestAppliance2Eth0PublicIpAddressName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	ip_version = "IPv4"
	allocation_method = "Dynamic"
	idle_timeout_in_minutes = 4
	domain_name_label = local.VirtualTestAppliance2DnsLabel
}

resource "azurerm_virtual_machine" "IxiaClient" {
	name = local.IxiaClientName
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	vm_size = local.IxiaClientVmSize
	storage_os_disk {
		os_type = "Windows"
		name = "disk_${local.IxiaClientName}"
		create_option = local.IxiaClientCreateOption
		vhd_uri = "https://${local.PageBlobsStorageAccountName}.blob.core.windows.net${local.IxiaClientPageBlobPath}"
		caching = "ReadWrite"
		disk_size_gb = local.IxiaClientDiskSizeGB
	}
	network_interface_ids = [
		azurerm_network_interface.IxiaClientEth0.id
	]
	boot_diagnostics {
		enabled = local.IxiaClientBootDiagnosticsEnabled
		storage_uri = "https://${local.DiagnosticsStorageAccountName}.blob.core.windows.net/"
	}
	depends_on = [
		azurerm_network_interface.IxiaClientEth0
	]
	timeouts {
		create = "5m"
		delete = "10m"
	}
}

resource "azurerm_virtual_machine" "VirtualTestAppliance1" {
	name = local.VirtualTestAppliance1Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	vm_size = local.VirtualTestApplianceVmSize
	storage_image_reference {
		id = local.VirtualTestApplianceImageId
	}
	storage_os_disk {
		os_type = "Linux"
		name = "disk_${local.VirtualTestAppliance1Name}"
		create_option = local.VirtualTestApplianceCreateOption
		caching = "ReadWrite"
		disk_size_gb = local.VirtualTestApplianceDiskSizeGB
	}
	os_profile {
		computer_name = local.VirtualTestAppliance1Name
		admin_username = local.AdminUserName
	}
	os_profile_linux_config {
		disable_password_authentication = local.VirtualTestApplianceDisablePasswordAuthentication
		ssh_keys {
			path = local.SshKeyPath
			key_data = local.SshPublicKeyData
		}
	}
	primary_network_interface_id = azurerm_network_interface.VirtualTestAppliance1Eth0.id
	network_interface_ids = [
		azurerm_network_interface.VirtualTestAppliance1Eth0.id,
		azurerm_network_interface.VirtualTestAppliance1Eth1.id
	]
	boot_diagnostics {
		enabled = local.VirtualTestApplianceBootDiagnosticsEnabled
		storage_uri = "https://${local.DiagnosticsStorageAccountName}.blob.core.windows.net/"
	}
	depends_on = [
		azurerm_network_interface.VirtualTestAppliance1Eth0,
		azurerm_network_interface.VirtualTestAppliance1Eth1
	]
	timeouts {
		create = "5m"
		delete = "10m"
	}
}

resource "azurerm_virtual_machine" "VirtualTestAppliance2" {
	name = local.VirtualTestAppliance2Name
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		Options = local.UserOptionsTag
		ResourceGroup = azurerm_resource_group.example.name
		Location = azurerm_resource_group.example.location
	}
	vm_size = local.VirtualTestApplianceVmSize
	storage_image_reference {
		id = local.VirtualTestApplianceImageId
	}
	storage_os_disk {
		os_type = "Linux"
		name = "disk_${local.VirtualTestAppliance2Name}"
		create_option = local.VirtualTestApplianceCreateOption
		caching = "ReadWrite"
		disk_size_gb = local.VirtualTestApplianceDiskSizeGB
	}
	os_profile {
		computer_name = local.VirtualTestAppliance2Name
		admin_username = local.AdminUserName
	}
	os_profile_linux_config {
		disable_password_authentication = local.VirtualTestApplianceDisablePasswordAuthentication
		ssh_keys {
			path = local.SshKeyPath
			key_data = local.SshPublicKeyData
		}
	}
	primary_network_interface_id = azurerm_network_interface.VirtualTestAppliance2Eth0.id
	network_interface_ids = [
		azurerm_network_interface.VirtualTestAppliance2Eth0.id,
		azurerm_network_interface.VirtualTestAppliance2Eth1.id
	]
	boot_diagnostics {
		enabled = local.VirtualTestApplianceBootDiagnosticsEnabled
		storage_uri = "https://${local.DiagnosticsStorageAccountName}.blob.core.windows.net/"
	}
	depends_on = [
		azurerm_network_interface.VirtualTestAppliance2Eth0,
		azurerm_network_interface.VirtualTestAppliance2Eth1
	]
	timeouts {
		create = "5m"
		delete = "10m"
	}
}