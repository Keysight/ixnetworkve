module "Vpc" {
	source = "armdupre/module-1-vpc-1-public-subnet-1-private-subnet/aws"
	InboundIPv4CidrBlock = local.InboundIPv4CidrBlock
	PrivateSubnetAvailabilityZone = local.PrivateSubnetAvailabilityZone
	PublicSubnetAvailabilityZone = local.PublicSubnetAvailabilityZone
	Region = local.Region
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
}