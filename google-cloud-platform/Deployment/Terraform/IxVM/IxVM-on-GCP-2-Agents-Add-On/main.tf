module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/google"
	version = "10.0.0"
	Eth0SubnetName = local.PublicSubnetName
	Eth0VpcNetworkName = local.PublicVpcNetworkName
	Eth1SubnetName = local.PrivateSubnetName
	Eth1VpcNetworkName = local.PrivateVpcNetworkName
	InstanceId = local.Agent1InstanceId
	MachineType = local.AgentMachineType
	RegionName = data.google_client_config.current.region
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = data.google_client_config.current.zone
}

module "Agent2" {
	source = "armdupre/module-ixnetwork-agent/google"
	version = "10.0.0"
	Eth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	Eth0SubnetName = local.PublicSubnetName
	Eth0VpcNetworkName = local.PublicVpcNetworkName
	Eth1PrivateIpAddress = local.Agent2Eth1PrivateIpAddress
	Eth1PrivateIpAliases = local.Agent2Eth1PrivateIpAliases
	Eth1SubnetName = local.PrivateSubnetName
	Eth1VpcNetworkName = local.PrivateVpcNetworkName
	InstanceId = local.Agent2InstanceId
	MachineType = local.AgentMachineType
	RegionName = data.google_client_config.current.region
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = data.google_client_config.current.zone
}