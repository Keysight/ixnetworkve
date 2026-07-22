data "aws_caller_identity" "current" {}

data "aws_ec2_instance_type" "Agent" {
	instance_type = local.AgentInstanceType
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
	state = "available"
}

data "cloudinit_config" "init_cli" {
	gzip = false
	base64_encode = false
	part {
		content_type = "text/cloud-config"
		content = file("cloud-init.yml")
	}
}

data "http" "ip" {
	url = "https://ifconfig.me/ip"
}
