module "vpc" {
	source = "../../modules/aws-1-vpc-1-public-subnet-2-private-subnets"
	ApiMaxRetries = var.ApiMaxRetries
	InboundIPv4CidrBlock = local.InboundIPv4CidrBlock
	Private1SubnetAvailabilityZone = local.Private1SubnetAvailabilityZone
	Private2SubnetAvailabilityZone = local.Private2SubnetAvailabilityZone
	ProjectTag = local.ProjectTag
	PublicSubnetAvailabilityZone = local.PublicSubnetAvailabilityZone
	Region = local.Region
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
}

resource "aws_security_group_rule" "PublicIngress22" {
	type = "ingress"
	security_group_id = module.vpc.PublicSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "PublicIngress3389" {
	type = "ingress"
	security_group_id = module.vpc.PublicSecurityGroup.id
	protocol = "tcp"
	from_port = 3389
	to_port = 3389
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}