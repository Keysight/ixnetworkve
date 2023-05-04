output "AgentAmi" {
	value = {
		"image_id" : data.aws_ami.AMI_AGENT.image_id
		"name" : data.aws_ami.AMI_AGENT.name
		"owner_id" : data.aws_ami.AMI_AGENT.owner_id
	}
}

output "AppAmi" {
	value = {
		"image_id" : data.aws_ami.AMI_APP.image_id
		"name" : data.aws_ami.AMI_APP.name
		"owner_id" : data.aws_ami.AMI_APP.owner_id
	}
}

output "AppEth0ElasticIp" {
	value = {
		"public_dns" : aws_eip.AppEth0ElasticIp.public_dns
		"public_ip" : aws_eip.AppEth0ElasticIp.public_ip
	}
}

output "AvailabilityZones" {
	value = {
		"available.names" : data.aws_availability_zones.available.names
	}
}