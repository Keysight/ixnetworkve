output "AgentImage" {
	value = {
		"family" : module.Agent1.Image.family
		"name" : module.Agent1.Image.name
		"project" : module.Agent1.Image.project
	}
}

output "Agent1Eth0PublicIpAddress" {
	value = {
		"address" : module.Agent1.Eth0PublicIpAddress.address
		"address_type" : module.Agent1.Eth0PublicIpAddress.address_type
	}
}

output "Agent1Instance" {
	value = {	
		"machine_type" : module.Agent1.Instance.machine_type
		"name" : module.Agent1.Instance.name
		"total_egress_bandwidth_tier" : module.Agent1.Instance.total_egress_bandwidth_tier
	}
}

output "Agent2Eth0PublicIpAddress" {
	value = {
		"address" : module.Agent2.Eth0PublicIpAddress.address
		"address_type" : module.Agent2.Eth0PublicIpAddress.address_type
	}
}

output "Agent2Instance" {
	value = {	
		"machine_type" : module.Agent2.Instance.machine_type
		"name" : module.Agent2.Instance.name
		"total_egress_bandwidth_tier" : module.Agent2.Instance.total_egress_bandwidth_tier
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