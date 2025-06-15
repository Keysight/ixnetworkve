module "Agent1" {
	source = "git::https://github.com/armdupre/terraform-aws-module-ixnetwork-cloud-agent.git?ref=0.0.1"
	AmiName = local.AgentAmiName
	AmiOwner = local.AgentAmiOwner
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	Eth1SecurityGroupId = module.Vpc.PrivateSecurityGroup.id
	Eth1SubnetId = module.Vpc.PrivateSubnet.id
	InstanceId = local.Agent1InstanceId
	InstanceType = local.AgentInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AgentVersion
	depends_on = [
		aws_placement_group.PlacementGroup,
		module.Vpc
	]
}

module "Agent2" {
	source = "git::https://github.com/armdupre/terraform-aws-module-ixnetwork-cloud-agent.git?ref=0.0.1"
	AmiName = local.AgentAmiName
	AmiOwner = local.AgentAmiOwner
	Eth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	Eth1PrivateIpAddresses = local.Agent2Eth1PrivateIpAddresses
	Eth1SecurityGroupId = module.Vpc.PrivateSecurityGroup.id
	Eth1SubnetId = module.Vpc.PrivateSubnet.id
	InstanceId = local.Agent2InstanceId
	InstanceType = local.AgentInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AgentVersion
	depends_on = [
		aws_placement_group.PlacementGroup,
		module.Vpc
	]
}

resource "aws_placement_group" "PlacementGroup" {
	name = local.PlacementGroupName
	strategy = local.PlacementGroupStrategy
}

resource "random_id" "RandomId" {
	byte_length = 4
}