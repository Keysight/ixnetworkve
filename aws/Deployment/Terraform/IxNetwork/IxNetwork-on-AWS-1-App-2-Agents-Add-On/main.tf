module "App" {
	source = "armdupre/module-ixnetwork-app/aws"
	version = "9.36.0"
	Eth0SecurityGroupId = local.PublicSecurityGroupId
	Eth0SubnetId = local.PublicSubnetId
	InstanceType = local.AppInstanceType
	SshKeyName = local.AppSshKeyName
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
}

module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/aws"
	version = "9.36.0"
	Eth0SecurityGroupId = local.PublicSecurityGroupId
	Eth0SubnetId = local.PublicSubnetId
	Eth1SecurityGroupId = local.PrivateSecurityGroupId
	Eth1SubnetId = local.PrivateSubnetId
	InstanceId = local.Agent1InstanceId
	InstanceType = local.AgentInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	depends_on = [
		aws_placement_group.PlacementGroup
	]
}

module "Agent2" {
	source = "armdupre/module-ixnetwork-agent/aws"
	version = "9.36.0"
	Eth0PrivateIpAddress = local.Agent2Eth0PrivateIpAddress
	Eth0SecurityGroupId = local.PublicSecurityGroupId
	Eth0SubnetId = local.PublicSubnetId
	Eth1PrivateIpAddresses = local.Agent2Eth1PrivateIpAddresses
	Eth1SecurityGroupId = local.PrivateSecurityGroupId
	Eth1SubnetId = local.PrivateSubnetId
	InstanceId = local.Agent2InstanceId
	InstanceType = local.AgentInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	depends_on = [
		aws_placement_group.PlacementGroup
	]
}

resource "aws_placement_group" "PlacementGroup" {
	name = local.PlacementGroupName
	strategy = local.PlacementGroupStrategy
}