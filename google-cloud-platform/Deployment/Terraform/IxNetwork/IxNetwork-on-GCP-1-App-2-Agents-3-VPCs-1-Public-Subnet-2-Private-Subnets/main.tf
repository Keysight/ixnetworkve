module "App" {
	source = "armdupre/module-ixnetwork-app/google"
	Eth0SubnetName = module.Vpc.PublicSubnet.name
	Eth0VpcNetworkName = module.Vpc.PublicVpcNetwork.name
	MachineType = local.AppMachineType
	RegionName = local.RegionName
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = local.ZoneName
	depends_on = [
		module.Vpc.PublicSubnet,
		module.Vpc.PublicVpcNetwork
	]
}

module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/google"
	Eth0SubnetName = module.Vpc.PublicSubnet.name
	Eth0VpcNetworkName = module.Vpc.PublicVpcNetwork.name
	Eth1SubnetName = module.Vpc.Private1Subnet.name
	Eth1VpcNetworkName = module.Vpc.Private1VpcNetwork.name
	MachineType = local.AgentMachineType
	RegionName = local.RegionName
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = local.ZoneName
	depends_on = [
		module.Vpc.PublicSubnet,
		module.Vpc.PublicVpcNetwork
	]
}

module "Agent2" {
	source = "armdupre/module-ixnetwork-agent/google"
	Eth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	Eth0SubnetName = module.Vpc.PublicSubnet.name
	Eth0VpcNetworkName = module.Vpc.PublicVpcNetwork.name
	Eth1PrivateIpAddress = local.Agent2Eth1PrivateIpAddress
	Eth1PrivateIpAliases = local.Agent2Eth1PrivateIpAliases
	Eth1SubnetName = module.Vpc.Private2Subnet.name
	Eth1VpcNetworkName = module.Vpc.Private2VpcNetwork.name
	InstanceId = local.Agent2InstanceId
	MachineType = local.AgentMachineType
	RegionName = local.RegionName
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = local.ZoneName
	depends_on = [
		module.Vpc.PublicSubnet,
		module.Vpc.PublicVpcNetwork
	]
}