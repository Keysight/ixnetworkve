resource "aws_placement_group" "PlacementGroup" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_PLACEMENT_GROUP_${local.uuid}_${local.RegionTag}"
	strategy = local.PlacementGroupStrategy
}

resource "aws_network_interface" "AppEth0" {
	description = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_APP_${local.AppVersion}_ETH0_${local.RegionTag}"
	source_dest_check = local.InterfaceSourceDestCheck
	subnet_id = module.vpc.PublicSubnet.id
	security_groups = [
		module.vpc.PublicSecurityGroup.id
	]
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_APP_${local.AppVersion}_ETH0_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_network_interface" "Agent1Eth0" {
	description = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT1_${local.AppVersion}_ETH0_${local.RegionTag}"
	source_dest_check = local.InterfaceSourceDestCheck
	subnet_id = module.vpc.PublicSubnet.id
	security_groups = [
		module.vpc.PublicSecurityGroup.id
	]
	private_ips = [ local.Agent1Eth0PrivateIpAddress ]
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT1_${local.AppVersion}_ETH0_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_network_interface" "Agent1Eth1" {
	description = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT1_${local.AppVersion}_ETH1_${local.RegionTag}"
	source_dest_check = local.InterfaceSourceDestCheck
	subnet_id = module.vpc.Private1Subnet.id
	security_groups = [
		module.vpc.PrivateSecurityGroup.id
	]
	private_ips = local.Agent1Eth1PrivateIpAddresses
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT1_${local.AppVersion}_ETH1_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_network_interface" "Agent2Eth0" {
	description = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT2_${local.AppVersion}_ETH0_${local.RegionTag}"
	source_dest_check = local.InterfaceSourceDestCheck
	subnet_id = module.vpc.PublicSubnet.id
	security_groups = [
		module.vpc.PublicSecurityGroup.id
	]
	private_ips = [ local.Agent2Eth0PrivateIpAddress ]
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT2_${local.AppVersion}_ETH0_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_network_interface" "Agent2Eth1" {
	description = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT2_${local.AppVersion}_ETH1_${local.RegionTag}"
	source_dest_check = local.InterfaceSourceDestCheck
	subnet_id = module.vpc.Private2Subnet.id
	security_groups = [
		module.vpc.PrivateSecurityGroup.id
	]
	private_ips = local.Agent2Eth1PrivateIpAddresses
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.AppTag}_AGENT2_${local.AppVersion}_ETH1_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_instance" "Agent1" {
	disable_api_termination = local.InstanceDisableApiTermination
	instance_initiated_shutdown_behavior = local.InstanceInstanceInitiatedShutdownBehavior
	ami = data.aws_ami.AMI_AGENT.image_id
	instance_type = local.AgentInstanceType
	monitoring = local.InstanceMonitoring
	iam_instance_profile = aws_iam_instance_profile.IamInstanceProfile.id
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_AGENT1_${local.AppTag}_${local.AppVersion}_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
	network_interface {
		network_interface_id = aws_network_interface.Agent1Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.Agent1Eth1.id
		device_index = "1"
	}
	root_block_device {
		delete_on_termination = local.InstanceEbsDeleteOnTermination
		volume_type = local.InstanceEbsVolumeType
	}
	timeouts {
		create = "9m"
		delete = "5m"
	}
}

resource "aws_instance" "Agent2" {
	disable_api_termination = local.InstanceDisableApiTermination
	instance_initiated_shutdown_behavior = local.InstanceInstanceInitiatedShutdownBehavior
	ami = data.aws_ami.AMI_AGENT.image_id
	instance_type = local.AgentInstanceType
	monitoring = local.InstanceMonitoring
	iam_instance_profile = aws_iam_instance_profile.IamInstanceProfile.id
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_AGENT2_${local.AppTag}_${local.AppVersion}_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
	network_interface {
		network_interface_id = aws_network_interface.Agent2Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.Agent2Eth1.id
		device_index = "1"
	}
	root_block_device {
		delete_on_termination = local.InstanceEbsDeleteOnTermination
		volume_type = local.InstanceEbsVolumeType
	}
	timeouts {
		create = "9m"
		delete = "5m"
	}
}

resource "aws_instance" "App" {
	disable_api_termination = local.InstanceDisableApiTermination
	instance_initiated_shutdown_behavior = local.InstanceInstanceInitiatedShutdownBehavior
	ami = data.aws_ami.AMI_APP.image_id
	instance_type = local.AppInstanceType
	monitoring = local.InstanceMonitoring
	key_name = local.AppSSHKey
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_APP_${local.AppTag}_${local.AppVersion}_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
	network_interface {
		network_interface_id = aws_network_interface.AppEth0.id
		device_index = "0"
	}
	root_block_device {
		delete_on_termination = local.InstanceEbsDeleteOnTermination
		volume_type = local.InstanceEbsVolumeType
	}
	timeouts {
		create = "9m"
		delete = "5m"
	}
}

resource "aws_eip" "AppEth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.AppEth0.id
	depends_on = [
		module.vpc.InternetGw,
		aws_instance.App
	]
}

resource "aws_eip" "Agent1Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.Agent1Eth0.id
	depends_on = [
		module.vpc.InternetGw,
		aws_instance.Agent1
	]
}

resource "aws_eip" "Agent2Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.Agent2Eth0.id
	depends_on = [
		module.vpc.InternetGw,
		aws_instance.Agent2
	]
}