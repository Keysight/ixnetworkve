module "App" {
	source = "armdupre/module-ixnetwork-app/aws"
	version = "10.0.0"
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	InstanceType = local.AppInstanceType
	SshKeyName = aws_key_pair.SshKey.key_name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	depends_on = [
		module.Vpc
	]
}

module "Agent1" {
	source = "armdupre/module-ixnetwork-agent/aws"
	version = "10.0.0"
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
	depends_on = [
		aws_placement_group.PlacementGroup,
		module.Vpc
	]
}

resource "aws_eip" "Agent1Eth1ElasticIp" {
	domain = "vpc"
	network_interface = module.Agent1.Eth1.id
	depends_on = [
		module.Agent1
	]
}

resource "aws_placement_group" "PlacementGroup" {
	name = local.PlacementGroupName
	strategy = local.PlacementGroupStrategy
}

resource "random_id" "RandomId" {
	byte_length = 4
}