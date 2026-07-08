locals {
	AgentInstanceType = var.AgentInstanceType
	Agent1Eth2PrivateIpAddresses = [ "10.0.2.22", "10.0.2.23", "10.0.2.24", "10.0.2.25", "10.0.2.26", "10.0.2.27", "10.0.2.28", "10.0.2.29", "10.0.2.30", "10.0.2.31" ]
	Agent1InstanceId = "agent1"
	ApiMaxRetries = var.ApiMaxRetries
	AppTag = "ixnetwork"
	AwsAccessCredentialsAccessKey = var.AwsAccessCredentialsAccessKey
	AwsAccessCredentialsSecretKey = var.AwsAccessCredentialsSecretKey
	InboundIPv4CidrBlocks = var.InboundIPv4CidrBlocks == null ? [ "${data.http.ip.response_body}/32" ] : var.InboundIPv4CidrBlocks
	PlacementGroupName = "${local.Preamble}-placement-group-${local.Region}"
	PlacementGroupStrategy = "cluster"
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}"
	PrivateSubnetAvailabilityZone = var.PrivateSubnetAvailabilityZone
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	Region = data.aws_region.current.region
	SleepDelay = "8m"
	UserEmailTag = var.UserEmailTag == null ? data.aws_caller_identity.current.user_id : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? random_id.RandomId.id : var.UserProjectTag
}
