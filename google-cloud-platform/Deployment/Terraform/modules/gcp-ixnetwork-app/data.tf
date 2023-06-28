data "google_compute_subnetwork" "AppEth0Subnet" {
	name = local.AppEth0SubnetName
}

data "google_compute_network" "AppEth0VpcNetwork" {
	name = local.AppEth0VpcNetworkName
}

data "google_compute_image" "AppImage" {
	family = local.AppCustomImageFamilyName
	project = local.AppCustomImageProjectId
}