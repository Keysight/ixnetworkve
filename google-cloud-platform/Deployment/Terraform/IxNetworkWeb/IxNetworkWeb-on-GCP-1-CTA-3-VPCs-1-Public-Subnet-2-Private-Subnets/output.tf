output "AppEth0PublicIpAddress" {
	value = {
		"address" : module.App.Eth0PublicIpAddress.address
		"address_type" : module.App.Eth0PublicIpAddress.address_type
	}
}

output "AppImage" {
	value = {
		"family" : module.App.Image.family
		"name" : module.App.Image.name
		"project" : module.App.Image.project
	}
}

output "AppInstance" {
	value = {
		"machine_type" : module.App.Instance.machine_type
		"name" : module.App.Instance.name
		"total_egress_bandwidth_tier" : module.App.Instance.total_egress_bandwidth_tier
	}
}

output "Private1VpcNetwork" {
	value = {
		"mtu" : module.Vpc.Private1VpcNetwork.mtu
		"name" : module.Vpc.Private1VpcNetwork.name
	}
}

output "Private2VpcNetwork" {
	value = {
		"mtu" : module.Vpc.Private2VpcNetwork.mtu
		"name" : module.Vpc.Private2VpcNetwork.name
	}
}

output "PublicVpcNetwork" {
	value = {
		"mtu" : module.Vpc.PublicVpcNetwork.mtu
		"name" : module.Vpc.PublicVpcNetwork.name
	}
}