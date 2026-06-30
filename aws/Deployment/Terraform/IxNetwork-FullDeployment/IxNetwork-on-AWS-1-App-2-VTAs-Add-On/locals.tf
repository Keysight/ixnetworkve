locals {
	AgentInstanceType = var.AgentInstanceType
	Agent1InstanceId = "agent1"
	Agent1Eth0PrivateIpAddress = "10.0.10.13"
	Agent1Eth1PrivateIpAddresses = [ "10.0.2.32", "10.0.2.33", "10.0.2.34", "10.0.2.35", "10.0.2.36", "10.0.2.37", "10.0.2.38", "10.0.2.39", "10.0.2.40", "10.0.2.41" ]
	Agent2Eth0PrivateIpAddress = "10.0.10.14"
	Agent2Eth1PrivateIpAddresses = [ "10.0.2.42", "10.0.2.43", "10.0.2.44", "10.0.2.45", "10.0.2.46", "10.0.2.47", "10.0.2.48", "10.0.2.49", "10.0.2.50", "10.0.2.51" ]
	Agent2InstanceId = "agent2"
	ApiMaxRetries = var.ApiMaxRetries
	AppInstanceType = var.AppInstanceType
	AppTag = "ixnetwork"
	AwsAccessCredentialsAccessKey = var.AwsAccessCredentialsAccessKey
	AwsAccessCredentialsSecretKey = var.AwsAccessCredentialsSecretKey
	PlacementGroupName = "${local.Preamble}-placement-group-${local.Region}"
	PlacementGroupStrategy = "cluster"
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}"
	PrivateSecurityGroupName = var.PrivateSecurityGroupName
	PrivateSubnetName = var.PrivateSubnetName
	PublicSecurityGroupName = var.PublicSecurityGroupName
	PublicSubnetName = var.PublicSubnetName
	Region = data.aws_region.current.region
	SshKeyAlgorithm = "RSA"
	SshKeyName = "${local.Preamble}-ssh-key"
	SshKeyRsaBits = "4096"
	UserEmailTag = var.UserEmailTag == null ? data.aws_caller_identity.current.user_id : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? random_id.RandomId.id : var.UserProjectTag
}
