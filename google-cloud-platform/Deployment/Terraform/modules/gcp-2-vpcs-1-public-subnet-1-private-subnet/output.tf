output "PrivateSubnet" {
	value = {
		"name" : google_compute_subnetwork.PrivateSubnet.name
		"self_link" : google_compute_subnetwork.PrivateSubnet.self_link
	}
}

output "PrivateVpcNetwork" {
	value = {
		"name" : google_compute_network.PrivateVpcNetwork.name
		"self_link" : google_compute_network.PrivateVpcNetwork.self_link
	}
}

output "PublicSubnet" {
	value = {
		"name" : google_compute_subnetwork.PublicSubnet.name
		"self_link" : google_compute_subnetwork.PublicSubnet.self_link
	}
}

output "PublicVpcNetwork" {
	value = {
		"name" : google_compute_network.PublicVpcNetwork.name
		"self_link" : google_compute_network.PublicVpcNetwork.self_link
	}
}