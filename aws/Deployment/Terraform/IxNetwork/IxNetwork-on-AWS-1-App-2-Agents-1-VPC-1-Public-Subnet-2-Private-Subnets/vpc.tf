module "Vpc" {
	source = "git::https://github.com/armdupre/terraform-aws-module-1-vpc-1-public-subnet-2-private-subnets.git?ref=11.0.0"
	InboundIPv4CidrBlocks = local.InboundIPv4CidrBlocks
	Private1SubnetAvailabilityZone = local.Private1SubnetAvailabilityZone
	Private2SubnetAvailabilityZone = local.Private2SubnetAvailabilityZone
	PublicSubnetAvailabilityZone = local.PublicSubnetAvailabilityZone
	Region = local.Region
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
}

resource "aws_security_group_rule" "PublicIngress3389" {
	type = "ingress"
	security_group_id = module.Vpc.PublicSecurityGroup.id
	protocol = "tcp"
	from_port = 3389
	to_port = 3389
	cidr_blocks = local.InboundIPv4CidrBlocks
}