module "App" {
	source = "git::https://github.com/armdupre/terraform-aws-module-ixnetwork-cloud-app.git?ref=11.0.0"
	Eth0SecurityGroupId = module.Vpc.PublicSecurityGroup.id
	Eth0SubnetId = module.Vpc.PublicSubnet.id
	Eth1SecurityGroupId = module.Vpc.PrivateSecurityGroup.id
	Eth1SubnetId = module.Vpc.PrivateSubnet.id
	Eth2PrivateIpAddresses = local.AppEth2PrivateIpAddresses
	Eth2SecurityGroupId = module.Vpc.PrivateSecurityGroup.id
	Eth2SubnetId = module.Vpc.PrivateSubnet.id
	InstanceType = local.AppInstanceType
	PlacementGroupId = aws_placement_group.PlacementGroup.id
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
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