locals {
	AgentCustomImageProjectId = var.AgentCustomImageProjectId
	AgentCustomImageFamilyName = var.AgentCustomImageFamilyName
	AgentEth0PrivateIpAddress = var.AgentEth0PrivateIpAddress
	AgentEth0PublicIpAddressName = "${local.AppName}-${local.AgentId}-eth0-ip-addr"
	AgentEth0SubnetName = var.AgentEth0SubnetName
	AgentEth0VpcNetworkName = var.AgentEth0VpcNetworkName
	AgentEth1PrivateIpAddress = var.AgentEth1PrivateIpAddress
	AgentEth1PrivateIpAliases = var.AgentEth1PrivateIpAliases
	AgentEth1SubnetName = var.AgentEth1SubnetName
	AgentEth1VpcNetworkName = var.AgentEth1VpcNetworkName
	AgentId = var.AgentId
	AgentInstanceName = "${local.AppName}-${local.AgentId}"
	AgentMachineType = var.AgentMachineType
	AgentNetworkTargetTags = [
		"${local.AppName}-agent"
	]
	AgentSerialPortEnable = true
	AppName = var.AppName
	LoginIdTag = var.LoginIdTag
	OwnerTag = var.OwnerTag
	ProjectTag = var.ProjectTag
	RegionName = var.RegionName
	ZoneName = var.ZoneName
}