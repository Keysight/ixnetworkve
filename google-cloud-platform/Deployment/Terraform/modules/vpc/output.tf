output "Private1Subnet" {
	value = {
		"self_link" : google_compute_subnetwork.Private1Subnet.self_link
	}
}

output "Private1VpcNetwork" {
	value = {
		"self_link" : google_compute_network.Private1VpcNetwork.self_link
	}
}

output "Private2Subnet" {
	value = {
		"self_link" : google_compute_subnetwork.Private2Subnet.self_link
	}
}

output "Private2VpcNetwork" {
	value = {
		"self_link" : google_compute_network.Private2VpcNetwork.self_link
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