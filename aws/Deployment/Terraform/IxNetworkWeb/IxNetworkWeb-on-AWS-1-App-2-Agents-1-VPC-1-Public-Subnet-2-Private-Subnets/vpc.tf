module "Vpc" {
	source = "armdupre/module-1-vpc-1-public-subnet-2-private-subnets/aws"
	version = "0.1.1"
	InboundIPv4CidrBlocks = local.InboundIPv4CidrBlocks
	Private1SubnetAvailabilityZone = local.Private1SubnetAvailabilityZone
	Private2SubnetAvailabilityZone = local.Private2SubnetAvailabilityZone
	PublicSubnetAvailabilityZone = local.PublicSubnetAvailabilityZone
	Region = local.Region
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
}