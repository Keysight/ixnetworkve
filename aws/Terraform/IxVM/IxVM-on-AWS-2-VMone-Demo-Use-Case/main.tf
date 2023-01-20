provider "aws" {
	region = var.Region
}

locals {
	Region = var.Region
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	IxClientSSHKey = var.IxClientSSHKey
	VMoneInstanceType = var.VMoneInstanceType
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	AMIxVMONE = {
		us-east-1 = "ami-0275bd934ef0556c2"
		us-east-2 = "ami-00929c8bb7d17cc16"
		us-west-1 = "ami-0ebc44c38f4f17cb3"
		us-west-2 = "ami-032bf4b528c97507d"
		ap-south-1 = "ami-0af781a81816bc1f1"
		ap-northeast-2 = "ami-0f19889b925842d44"
		ap-southeast-1 = "ami-084e88fe113ad6991"
		ap-southeast-2 = "ami-08376ccea5693111c"
		ap-northeast-1 = "ami-0301f66000e31724d"
		ca-central-1 = "ami-0cf2db0e86b985e62"
		eu-central-1 = "ami-03affb83698f679f7"
		eu-west-1 = "ami-07273e361412a0fbe"
		eu-west-2 = "ami-01c8afed8efdeda3a"
		eu-west-3 = "ami-0991590f5f4acb2b9"
		eu-north-1 = "ami-0d899b2be60c74181"
		sa-east-1 = "ami-0daf0859e3e0466ef"
	}
	EC2xCONNECTxCIDR = {
		us-east-1 = "18.206.107.24/29"
		us-east-2 = "3.16.146.0/29"
		us-west-1 = "13.52.6.112/29"
		us-west-2 = "18.237.140.160/29"
		ap-northeast-2 = "13.209.1.56/29"
		ap-southeast-1 = "3.0.5.32/29"
		ap-southeast-2 = "13.239.158.0/29"
		ap-northeast-1 = "3.112.23.0/29"
		ca-central-1 = "35.183.92.176/29"
		eu-central-1 = "3.120.181.40/29"
		eu-west-1 = "18.202.216.48/29"
		eu-west-2 = "3.8.37.24/29"
		eu-west-3 = "35.180.112.80/29"
		eu-north-1 = "13.48.4.200/30"
		sa-east-1 = "13.48.4.200/30"
	}
	EC2xREGION = {
		us-east-1 = "US East (N. Virginia)"
		us-east-2 = "US East (Ohio)"
		us-west-1 = "US West (N. California)"
		us-west-2 = "US West (Oregon)"
		ap-south-1 = "Asia Pacific (Mumbai)"
		ap-northeast-2 = "Asia Pacific (Seoul)"
		ap-southeast-1 = "Asia Pacific (Singapore)"
		ap-southeast-2 = "Asia Pacific (Sydney)"
		ap-northeast-1 = "Asia Pacific (Tokyo)"
		ca-central-1 = "Canada (Central)"
		eu-central-1 = "EU (Frankfurt)"
		eu-west-1 = "EU (Ireland)"
		eu-west-2 = "EU (London)"
		eu-west-3 = "EU (Paris)"
		eu-north-1 = "EU (Stockholm)"
		sa-east-1 = "South America (Sao Paulo)"
	}
	REGIONxTAG = {
		us-east-1 = "US_EAST_1"
		us-east-2 = "US_EAST_2"
		us-west-1 = "US_WEST_1"
		us-west-2 = "US_WEST_2"
		ap-south-1 = "AP_SOUTH_1"
		ap-northeast-2 = "AP_NORTHEAST_2"
		ap-southeast-1 = "AP_SOUTHEAST_1"
		ap-southeast-2 = "AP_SOUTHEAST_2"
		ap-northeast-1 = "AP_NORTHEAST_1"
		ca-central-1 = "CA_CENTRAL_1"
		eu-central-1 = "EU_CENTRAL_1"
		eu-west-1 = "EU_WEST_1"
		eu-west-2 = "EU_WEST_2"
		eu-west-3 = "EU_WEST_3"
		eu-north-1 = "EU_NORTH_1"
		sa-east-1 = "SA_EAST_1"
	}
	OPTIONSxTAG = "MANUAL"
	PROJECTxTAG = "OPEN_IXIA"
	VPCxCIDRxBLOCK = "10.0.0.0/16"
	VPCxINSTANCExTENANCY = "default"
	VPCxENABLExDNSxSUPPORT = true
	VPCxENABLExDNSxHOSTNAMES = true
	PLACEMENTxGROUPxSTRATEGY = "cluster"
	FLOWxLOGxTRAFFICxTYPE = "REJECT"
	SUBNETxAVAILABILITYxZONExINDEX = "0"
	MGMTxSUBNETxCIDRxBLOCK = "10.0.10.0/24"
	TEST1xSUBNETxCIDRxBLOCK = "10.0.2.0/24"
	TEST2xSUBNETxCIDRxBLOCK = "10.0.3.0/24"
	INTERFACExSOURCExDESTxCHECK = false
	INSTANCExDISABLExAPIxTERMINATION = false
	INSTANCExMONITORING = false
	INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR = "stop"
	INSTANCExBLOCKxDEVICExNAME = "/dev/sda1"
	INSTANCExEBSxDELETExONxTERMINATION = true
	INSTANCExEBSxVOLUMExTYPE = "gp2"
	APPxTAG = "IXLOAD"
	APPxVERSION = "9.20"
	VMONE1xETH0xPRIVATExIPxADDRESS = "10.0.10.11"
	VMONE1xETH1xPRIVATExIPxADDRESSES = [ "10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21" ]
	VMONE2xETH0xPRIVATExIPxADDRESS = "10.0.10.12"
	VMONE2xETH1xPRIVATExIPxADDRESSES = [ "10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21" ]
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_placement_group" "PlacementGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_PLACEMENT_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	strategy = local.PLACEMENTxGROUPxSTRATEGY
}

resource "aws_vpc" "Vpc" {
	cidr_block = local.VPCxCIDRxBLOCK
	instance_tenancy = local.VPCxINSTANCExTENANCY
	enable_dns_support = local.VPCxENABLExDNSxSUPPORT
	enable_dns_hostnames = local.VPCxENABLExDNSxHOSTNAMES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_flow_log" "VpcFlowLog" {
	log_destination =  aws_cloudwatch_log_group.VpcFlowLogGroup.arn
	iam_role_arn = aws_iam_role.VPCFlowLogAccessRole.arn
	vpc_id = aws_vpc.Vpc.id
	traffic_type = local.FLOWxLOGxTRAFFICxTYPE
}

resource "aws_iam_role" "VPCFlowLogAccessRole" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_FLOW_LOG_ACCESS_ROLE_${local.REGIONxTAG["${local.Region}"]}"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "vpc-flow-logs.amazonaws.com"
			},
			"Effect": "Allow"
		}
	]
}
EOF
	permissions_boundary = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
	path = "/"
}

resource "aws_cloudwatch_log_group" "VpcFlowLogGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_FLOW_LOG_GROUP_${local.REGIONxTAG["${local.Region}"]}"
}

resource "aws_subnet" "MgmtSubnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.MGMTxSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "Test1Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST1xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "Test2Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST2xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST2_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group" "MgmtSecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "MgmtIngress1" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.MgmtSecurityGroup.id
}

resource "aws_security_group_rule" "MgmtIngress2" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.EC2xCONNECTxCIDR["${local.Region}"] ]
}

resource "aws_security_group_rule" "MgmtIngress22" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress443" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 443
	to_port = 443
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress3389" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 3389
	to_port = 3389
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtEgress1" {
	type = "egress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group" "Test1SecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	ingress {
		description = "HTTP port"
		from_port = "80"
		protocol = "tcp"
		to_port = "80"
		cidr_blocks = [ local.InboundIPv4CidrBlock ]
	}
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "Test1Ingress1" {
	type = "ingress"
	security_group_id = aws_security_group.Test1SecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.Test1SecurityGroup.id
}

resource "aws_security_group_rule" "Test1Egress1" {
	type = "egress"
	security_group_id = aws_security_group.Test1SecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_default_security_group" "DefaultEgress1" {
	vpc_id = aws_vpc.Vpc.id

	egress {
		protocol = -1
		self = true
		from_port = 0
		to_port = 0
	}
}

resource "aws_internet_gateway" "InternetGw" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_INTERNET_GW_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "MgmtRoute" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.MgmtRouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "MgmtRouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "Test1Route" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.Test1RouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}
	
resource "aws_route_table" "Test1RouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "Test2Route" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.Test2RouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "Test2RouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST2_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route_table_association" "MgmtSubnetRouteTableAssociation" {
	route_table_id = aws_route_table.MgmtRouteTable.id
	subnet_id = aws_subnet.MgmtSubnet.id
}

resource "aws_route_table_association" "Test1SubnetRouteTableAssociation" {
	route_table_id = aws_route_table.Test1RouteTable.id
	subnet_id = aws_subnet.Test1Subnet.id
}

resource "aws_route_table_association" "Test2SubnetRouteTableAssociation" {
	route_table_id = aws_route_table.Test2RouteTable.id
	subnet_id = aws_subnet.Test2Subnet.id
}

resource "aws_network_interface" "VMOne1Eth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE1_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.MgmtSubnet.id
	security_groups = [
		aws_security_group.MgmtSecurityGroup.id
	]
	private_ips = [ local.VMONE1xETH0xPRIVATExIPxADDRESS ]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE1_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "VMOne1Eth1" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE1_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.Test1Subnet.id
	security_groups = [
		aws_security_group.Test1SecurityGroup.id
	]
	private_ips = local.VMONE1xETH1xPRIVATExIPxADDRESSES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE1_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}
		
resource "aws_network_interface" "VMOne2Eth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE2_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.MgmtSubnet.id
	security_groups = [
		aws_security_group.MgmtSecurityGroup.id
	]
	private_ips = [ local.VMONE2xETH0xPRIVATExIPxADDRESS ]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE2_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "VMOne2Eth1" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE2_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.Test2Subnet.id
	security_groups = [
		aws_security_group.Test1SecurityGroup.id
	]
	private_ips = local.VMONE2xETH1xPRIVATExIPxADDRESSES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE2_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_instance" "VMOne1" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxVMONE["${local.Region}"]
	instance_type = local.VMoneInstanceType
	monitoring = local.INSTANCExMONITORING
	key_name = local.IxClientSSHKey
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE1_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	network_interface {
		network_interface_id = aws_network_interface.VMOne1Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.VMOne1Eth1.id
		device_index = "1"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		delete_on_termination = local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
}

resource "aws_instance" "VMOne2" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxVMONE["${local.Region}"]
	instance_type = local.VMoneInstanceType
	monitoring = local.INSTANCExMONITORING
	key_name = local.IxClientSSHKey
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VMONE2_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	network_interface {
		network_interface_id = aws_network_interface.VMOne2Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.VMOne2Eth1.id
		device_index = "1"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		delete_on_termination =  local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
}

resource "aws_eip" "VMOne1Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.VMOne1Eth0.id
	depends_on = [
		aws_internet_gateway.InternetGw,
		aws_instance.VMOne1
	]
}

resource "aws_eip" "VMOne2Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.VMOne2Eth0.id
	depends_on = [
		aws_internet_gateway.InternetGw,
		aws_instance.VMOne2
	]
}