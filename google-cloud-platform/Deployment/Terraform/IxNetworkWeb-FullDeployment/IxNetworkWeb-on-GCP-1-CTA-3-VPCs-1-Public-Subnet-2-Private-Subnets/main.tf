module "Agent1" {
	source = "git::https://github.com/Keysight/terraform-google-module-ixnetwork-cloud-agent.git?ref=26.3.1.spoke"
	Eth0SubnetName = module.Vpc.PublicSubnet.name
	Eth0VpcNetworkName = module.Vpc.PublicVpcNetwork.name
	Eth1SubnetName = module.Vpc.Private1Subnet.name
	Eth1VpcNetworkName = module.Vpc.Private1VpcNetwork.name
	Eth2SubnetName = module.Vpc.Private2Subnet.name
	Eth2VpcNetworkName = module.Vpc.Private2VpcNetwork.name
	MachineType = local.AgentMachineType
	RegionName = data.google_client_config.current.region
	SleepDelay = local.SleepDelay
	TotalEgressBandwidthTier = local.AgentTotalEgressBandwidthTier
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = data.google_client_config.current.zone
	init_cli = data.cloudinit_config.init_cli.rendered
	depends_on = [
		module.Vpc.PublicSubnet,
		module.Vpc.PublicVpcNetwork
	]
}

resource "random_id" "RandomId" {
	byte_length = 4
}
