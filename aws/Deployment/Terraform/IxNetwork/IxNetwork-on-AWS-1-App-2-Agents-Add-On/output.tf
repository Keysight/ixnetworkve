output "AgentAmi" {
	value = {
		"image_id" : module.Agent1.Ami.image_id
		"name" : module.Agent1.Ami.name
		"owner_id" : module.Agent1.Ami.owner_id
	}
}

output "Agent1Eth0ElasticIp" {
	value = {
		"public_dns" : module.Agent1.Eth0ElasticIp.public_dns
		"public_ip" : module.Agent1.Eth0ElasticIp.public_ip
	}
}

output "Agent2Eth0ElasticIp" {
	value = {
		"public_dns" : module.Agent2.Eth0ElasticIp.public_dns
		"public_ip" : module.Agent2.Eth0ElasticIp.public_ip
	}
}

output "AppAmi" {
	value = {
		"image_id" : module.App.Ami.image_id
		"name" : module.App.Ami.name
		"owner_id" : module.App.Ami.owner_id
	}
}

output "AppEth0ElasticIp" {
	value = {
		"public_dns" : module.App.Eth0ElasticIp.public_dns
		"public_ip" : module.App.Eth0ElasticIp.public_ip
	}
}

output "AvailabilityZones" {
	value = {
		"available.names" : data.aws_availability_zones.available.names
	}
}

output "SshKey" {
	sensitive = true
	value = {
		"private_key_openssh" : tls_private_key.SshKey.private_key_openssh
		"private_key_pem" : tls_private_key.SshKey.private_key_pem
		"public_key_openssh" : tls_private_key.SshKey.public_key_openssh
		"public_key_pem" : tls_private_key.SshKey.public_key_pem
	}
}