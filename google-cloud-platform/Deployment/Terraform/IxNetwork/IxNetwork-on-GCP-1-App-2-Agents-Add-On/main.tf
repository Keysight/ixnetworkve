module "App" {
	source = "armdupre/module-ixnetwork-app/google"
	version = "10.0.0"
	Eth0SubnetName = data.google_compute_subnetwork.PublicSubnet.name
	Eth0VpcNetworkName = data.google_compute_network.PublicVpcNetwork.name
	MachineType = local.AppMachineType
	RegionName = data.google_client_config.current.region
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = data.google_client_config.current.zone
}

module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/google"
	version = "10.0.0"
	Eth0SubnetName = data.google_compute_subnetwork.PublicSubnet.name
	Eth0VpcNetworkName = data.google_compute_network.PublicVpcNetwork.name
	Eth1SubnetName = data.google_compute_subnetwork.PrivateSubnet.name
	Eth1VpcNetworkName = data.google_compute_network.PrivateVpcNetwork.name
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
	Eth0SubnetName = data.google_compute_subnetwork.PublicSubnet.name
	Eth0VpcNetworkName = data.google_compute_network.PublicVpcNetwork.name
	Eth1PrivateIpAddress = local.Agent2Eth1PrivateIpAddress
	Eth1PrivateIpAliases = local.Agent2Eth1PrivateIpAliases
	Eth1SubnetName = data.google_compute_subnetwork.PrivateSubnet.name
	Eth1VpcNetworkName = data.google_compute_network.PrivateVpcNetwork.name
	InstanceId = local.Agent2InstanceId
	MachineType = local.AgentMachineType
	RegionName = data.google_client_config.current.region
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = data.google_client_config.current.zone
}