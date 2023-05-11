output "AgentImage" {
	value = {
		"family" : module.agent.AgentImage.family
		"name" : module.agent.AgentImage.name
		"project" : module.agent.AgentImage.project
	}
}

output "AppEth0PublicIpAddress" {
	value = {
		"address" : module.app.AppEth0PublicIpAddress.address
		"address_type" : module.app.AppEth0PublicIpAddress.address_type
	}
}

output "AppImage" {
	value = {
		"family" : module.app.AppImage.family
		"name" : module.app.AppImage.name
		"project" : module.app.AppImage.project
	}
}