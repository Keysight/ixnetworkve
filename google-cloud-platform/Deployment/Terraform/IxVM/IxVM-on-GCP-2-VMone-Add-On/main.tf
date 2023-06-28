module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/google"
	Eth0SubnetName = local.PublicSubnetName
	Eth0VpcNetworkName = local.PublicVpcNetworkName
	Eth1SubnetName = local.PrivateSubnetName
	Eth1VpcNetworkName = local.PrivateVpcNetworkName
	MachineType = local.AgentMachineType
	RegionName = local.RegionName
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = local.ZoneName
}

module "Agent2" {
	source = "armdupre/module-ixnetwork-agent/google"
	Eth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	Eth0SubnetName = local.PublicSubnetName
	Eth0VpcNetworkName = local.PublicVpcNetworkName
	Eth1PrivateIpAddress = local.Agent2Eth1PrivateIpAddress
	Eth1PrivateIpAliases = local.Agent2Eth1PrivateIpAliases
	Eth1SubnetName = local.PrivateSubnetName
	Eth1VpcNetworkName = local.PrivateVpcNetworkName
	InstanceId = local.Agent2InstanceId
	MachineType = local.AgentMachineType
	RegionName = local.RegionName
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = local.ZoneName
}