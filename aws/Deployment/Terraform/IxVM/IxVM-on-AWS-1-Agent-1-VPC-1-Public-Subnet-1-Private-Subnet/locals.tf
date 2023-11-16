locals {
	AgentInstanceType = var.AgentInstanceType
	Agent1InstanceId = "agent1"
	AppTag = "ixnetwork"
	AppVersion = "9-36"
	InboundIPv4CidrBlocks = var.InboundIPv4CidrBlocks
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