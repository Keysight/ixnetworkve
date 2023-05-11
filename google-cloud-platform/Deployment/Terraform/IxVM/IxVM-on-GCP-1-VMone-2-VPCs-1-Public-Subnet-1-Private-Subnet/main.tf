module "agent" {
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