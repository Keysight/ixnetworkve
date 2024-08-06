module "Agent1" {
	source = "git::https://github.com/armdupre/terraform-google-module-ixnetwork-agent.git?ref=10.40.0"
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
	source = "git::https://github.com/armdupre/terraform-google-module-ixnetwork-agent.git?ref=10.40.0"
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

resource "random_id" "RandomId" {
	byte_length = 4
}