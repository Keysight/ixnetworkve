module "app" {
	source = "../../modules/gcp-ixnetwork-app"
	AppEth0SubnetName = module.vpc.PublicSubnet.name
	AppEth0VpcNetworkName = module.vpc.PublicVpcNetwork.name
	AppMachineType = local.AppMachineType
	LoginIdTag = local.LoginIdTag
	OwnerTag = local.OwnerTag
	ProjectTag = local.ProjectTag
	RegionName = local.RegionName
	ZoneName = local.ZoneName
	depends_on = [
		module.vpc.PublicSubnet,
		module.vpc.PublicVpcNetwork
	]
}

module "agent1" {
	source = "../../modules/gcp-ixnetwork-agent"
	AgentEth0SubnetName = module.vpc.PublicSubnet.name
	AgentEth0VpcNetworkName = module.vpc.PublicVpcNetwork.name
	AgentEth1SubnetName = module.vpc.PrivateSubnet.name
	AgentEth1VpcNetworkName = module.vpc.PrivateVpcNetwork.name
	AgentMachineType = local.AgentMachineType
	LoginIdTag = local.LoginIdTag
	OwnerTag = local.OwnerTag
	ProjectTag = local.ProjectTag
	RegionName = local.RegionName
	ZoneName = local.ZoneName
	depends_on = [
		module.vpc.PublicSubnet,
		module.vpc.PublicVpcNetwork
	]
}

module "agent2" {
	source = "../../modules/gcp-ixnetwork-agent"
	AgentEth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	AgentEth0SubnetName = module.vpc.PublicSubnet.name
	AgentEth0VpcNetworkName = module.vpc.PublicVpcNetwork.name
	AgentEth1PrivateIpAddress = local.Agent2Eth1PrivateIpAddress
	AgentEth1PrivateIpAliases = local.Agent2Eth1PrivateIpAliases
	AgentEth1SubnetName = module.vpc.PrivateSubnet.name
	AgentEth1VpcNetworkName = module.vpc.PrivateVpcNetwork.name
	AgentId = local.Agent2Id
	AgentMachineType = local.AgentMachineType
	LoginIdTag = local.LoginIdTag
	OwnerTag = local.OwnerTag
	ProjectTag = local.ProjectTag
	RegionName = local.RegionName
	ZoneName = local.ZoneName
	depends_on = [
		module.vpc.PublicSubnet,
		module.vpc.PublicVpcNetwork
	]
}