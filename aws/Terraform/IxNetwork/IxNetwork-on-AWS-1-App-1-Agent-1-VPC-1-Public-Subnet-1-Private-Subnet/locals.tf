locals {
	AgentInstanceType = var.AgentInstanceType
	Agent1InstanceId = "agent1"
	AppInstanceType = var.AppInstanceType
	AppSshKeyName = var.AppSshKeyName
	AppTag = "ixnetwork"
	AppVersion = "9-30"
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	PlacementGroupName = "${local.Preamble}-placement-group-${local.Region}"
	PlacementGroupStrategy = "cluster"
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}-${local.AppVersion}"
	PrivateSubnetAvailabilityZone = var.PrivateSubnetAvailabilityZone
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	Region = data.aws_region.current.name
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
}