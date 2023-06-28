locals {
	AppCustomImageProjectId = var.AppCustomImageProjectId
	AppCustomImageFamilyName = var.AppCustomImageFamilyName
	AppEth0PrivateIpAddress = var.AppEth0PrivateIpAddress
	AppEth0PublicIpAddressName = "${local.AppName}-${local.AppId}-eth0-ip-addr"
	AppEth0SubnetName = var.AppEth0SubnetName
	AppEth0VpcNetworkName = var.AppEth0VpcNetworkName
	AppId = var.AppId
	AppInstanceName = "${local.AppName}-${local.AppId}"
	AppMachineType = var.AppMachineType
	AppName = var.AppName
	AppNetworkTargetTags = [
		"${local.AppName}-app"
	]
	LoginIdTag = var.LoginIdTag
	OwnerTag = var.OwnerTag
	ProjectTag = var.ProjectTag
	RegionName = var.RegionName
	ZoneName = var.ZoneName
}