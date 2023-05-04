locals {
	FlowLogTrafficType = "REJECT"
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	Private1SubnetAvailabilityZone = var.Private1SubnetAvailabilityZone
	Private1SubnetCidrBlock = "10.0.2.0/24"
	Private2SubnetAvailabilityZone = var.Private2SubnetAvailabilityZone
	Private2SubnetCidrBlock = "10.0.3.0/24"
	ProjectTag = var.ProjectTag
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	PublicSubnetCidrBlock = "10.0.10.0/24"
	Region = var.Region
	RegionTag = upper(replace(local.Region, "-", "_"))
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	VpcCidrBlock = "10.0.0.0/16"
	VpcEnableDnsHostnames = true
	VpcEnableDnsSupport = true
	VpcInstanceTenancy = "default"
	uuid = substr(uuid(), 1, 6)
}