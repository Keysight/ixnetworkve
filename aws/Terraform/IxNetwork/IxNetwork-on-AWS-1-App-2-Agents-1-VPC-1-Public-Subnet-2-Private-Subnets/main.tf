module "App" {
	source = "armdupre/module-ixnetwork-app/aws"
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	InstanceType = local.AppInstanceType
	SshKeyName = local.AppSshKeyName
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
	depends_on = [
		module.Vpc
	]
}

module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/aws"
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	Eth1SecurityGroupId = module.Vpc.PrivateSecurityGroup.id
	Eth1SubnetId = module.Vpc.Private1Subnet.id
	InstanceId = local.Agent1InstanceId
	InstanceType = local.AgentInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
	depends_on = [
		aws_placement_group.PlacementGroup,
		module.Vpc
	]
}

module "Agent2" {
	source = "armdupre/module-ixnetwork-agent/aws"
	Eth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	Eth1PrivateIpAddresses = local.Agent2Eth1PrivateIpAddresses
	Eth1SecurityGroupId = module.Vpc.PrivateSecurityGroup.id
	Eth1SubnetId = module.Vpc.Private2Subnet.id
	InstanceId = local.Agent2InstanceId
	InstanceType = local.AgentInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
	depends_on = [
		aws_placement_group.PlacementGroup,
		module.Vpc
	]
}

resource "aws_placement_group" "PlacementGroup" {
	name = local.PlacementGroupName
	strategy = local.PlacementGroupStrategy
}