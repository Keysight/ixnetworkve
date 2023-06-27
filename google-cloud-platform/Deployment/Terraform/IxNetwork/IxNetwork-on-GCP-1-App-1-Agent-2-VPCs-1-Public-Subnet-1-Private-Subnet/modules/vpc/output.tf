output "PrivateSubnet" {
	value = {
		"self_link" : google_compute_subnetwork.PrivateSubnet.self_link
	}
}

output "PrivateVpcNetwork" {
	value = {
		"self_link" : google_compute_network.PrivateVpcNetwork.self_link
	}
}

output "PublicSubnet" {
	value = {
		"self_link" : google_compute_subnetwork.PublicSubnet.self_link
	}
}

output "PublicVpcNetwork" {
	value = {
		"self_link" : google_compute_network.PublicVpcNetwork.self_link
	}
}