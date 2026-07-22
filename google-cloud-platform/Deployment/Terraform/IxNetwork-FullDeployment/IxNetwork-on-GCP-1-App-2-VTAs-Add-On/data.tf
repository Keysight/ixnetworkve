data "google_client_config" "current" {}

data "google_compute_machine_types" "Agent" {
	filter = "name = ${local.AgentMachineType}"
	zone = data.google_client_config.current.zone
}

data "google_compute_machine_types" "App" {
	filter = "name = ${local.AppMachineType}"
	zone = data.google_client_config.current.zone
}

data "google_compute_subnetwork" "PrivateSubnet" {
	name = local.PrivateSubnetName
}

data "google_compute_network" "PrivateVpcNetwork" {
	name = local.PrivateVpcNetworkName
}

data "google_compute_subnetwork" "PublicSubnet" {
	name = local.PublicSubnetName
}

data "google_compute_network" "PublicVpcNetwork" {
	name = local.PublicVpcNetworkName
}
