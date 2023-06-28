data "google_compute_subnetwork" "AgentEth0Subnet" {
	name = local.AgentEth0SubnetName
}

data "google_compute_network" "AgentEth0VpcNetwork" {
	name = local.AgentEth0VpcNetworkName
}

data "google_compute_subnetwork" "AgentEth1Subnet" {
	name = local.AgentEth1SubnetName
}

data "google_compute_network" "AgentEth1VpcNetwork" {
	name = local.AgentEth1VpcNetworkName
}

data "google_compute_image" "AgentImage" {
	family = local.AgentCustomImageFamilyName
	project = local.AgentCustomImageProjectId
}