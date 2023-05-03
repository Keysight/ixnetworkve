data "aws_region" "current" {}

data "aws_availability_zones" "available" {
	state = "available"
}

data "aws_ami" "AMI_APP" {
	owners = [ local.AppAmiOwner ]
	filter {
		name = "name"
		values = [ local.AppAmiName ]
    }
	most_recent = true
}

data "aws_ami" "AMI_AGENT" {
	owners = [ local.AgentAmiOwner ]
	filter {
		name = "name"
		values = [ local.AgentAmiName ]
    }
	most_recent = true
}