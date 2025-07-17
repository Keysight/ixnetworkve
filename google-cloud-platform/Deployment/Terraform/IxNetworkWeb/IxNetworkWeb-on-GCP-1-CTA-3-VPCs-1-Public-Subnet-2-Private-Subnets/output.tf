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
	}
}
	