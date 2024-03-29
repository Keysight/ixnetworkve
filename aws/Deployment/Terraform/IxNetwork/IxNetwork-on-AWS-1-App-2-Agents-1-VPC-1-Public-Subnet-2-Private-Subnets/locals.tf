locals {
	AgentInstanceType = var.AgentInstanceType
	Agent1InstanceId = "agent1"
	Agent2Eth0PrivateIpAddress = "10.0.10.12"
	Agent2Eth1PrivateIpAddresses = [ "10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21" ]
	Agent2InstanceId = "agent2"
	AppInstanceType = var.AppInstanceType
	AppTag = "ixnetwork"
	InboundIPv4CidrBlocks = var.InboundIPv4CidrBlocks
	PlacementGroupName = "${local.Preamble}-placement-group-${local.Region}"
	PlacementGroupStrategy = "cluster"
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}"
	Private1SubnetAvailabilityZone = var.Private1SubnetAvailabilityZone
	Private2SubnetAvailabilityZone = var.Private2SubnetAvailabilityZone
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	Region = data.aws_region.current.name
	SshKeyAlgorithm = "RSA"
	SshKeyName = "${local.Preamble}-ssh-key"
	SshKeyRsaBits = "4096"
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
}