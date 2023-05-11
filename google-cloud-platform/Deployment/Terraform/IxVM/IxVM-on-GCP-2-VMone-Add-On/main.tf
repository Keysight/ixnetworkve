module "agent1" {
	source = "../../modules/gcp-ixnetwork-agent"
	AgentEth0SubnetName = local.PublicSubnetName
	AgentEth0VpcNetworkName = local.PublicVpcNetworkName
	AgentEth1SubnetName = local.PrivateSubnetName
	AgentEth1VpcNetworkName = local.PrivateVpcNetworkName
	AgentMachineType = local.AgentMachineType
	LoginIdTag = local.LoginIdTag
	OwnerTag = local.OwnerTag
	ProjectTag = local.ProjectTag
	RegionName = local.RegionName
	ZoneName = local.ZoneName
}

module "agent2" {
	source = "../../modules/gcp-ixnetwork-agent"
	AgentEth0SubnetName = local.PublicSubnetName
	AgentEth0VpcNetworkName = local.PublicVpcNetworkName
	AgentEth1SubnetName = local.PrivateSubnetName
	AgentEth1VpcNetworkName = local.PrivateVpcNetworkName
	AgentMachineType = local.AgentMachineType
	AgentEth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	AgentEth1PrivateIpAddress = local.Agent2Eth1PrivateIpAddress
	AgentEth1PrivateIpAliases = local.Agent2Eth1PrivateIpAliases
	AgentId = local.Agent2Id
	LoginIdTag = local.LoginIdTag
	OwnerTag = local.OwnerTag
	ProjectTag = local.ProjectTag
	RegionName = local.RegionName
	ZoneName = local.ZoneName
}