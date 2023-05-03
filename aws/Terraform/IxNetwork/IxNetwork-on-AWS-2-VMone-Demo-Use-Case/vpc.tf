resource "aws_vpc" "Vpc" {
	cidr_block = local.VPCxCIDRxBLOCK
	instance_tenancy = local.VPCxINSTANCExTENANCY
	enable_dns_support = local.VPCxENABLExDNSxSUPPORT
	enable_dns_hostnames = local.VPCxENABLExDNSxHOSTNAMES
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_VPC_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_flow_log" "VpcFlowLog" {
	log_destination =  aws_cloudwatch_log_group.VpcFlowLogGroup.arn
	iam_role_arn = aws_iam_role.VPCFlowLogAccessRole.arn
	vpc_id = aws_vpc.Vpc.id
	traffic_type = local.FLOWxLOGxTRAFFICxTYPE
}

resource "aws_iam_role" "VPCFlowLogAccessRole" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_VPC_FLOW_LOG_ACCESS_ROLE_${local.RegionTag}"
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
	name = "${local.UserLoginTag}_${local.ProjectTag}_VPC_FLOW_LOG_GROUP_${local.RegionTag}"
}

resource "aws_subnet" "MgmtSubnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.MGMTxSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_MGMT_SUBNET_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_subnet" "Test1Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST1xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_TEST1_SUBNET_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_subnet" "Test2Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST2xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_TEST2_SUBNET_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_security_group" "MgmtSecurityGroup" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_MGMT_SECURITY_GROUP_${local.RegionTag}"
	description = "${local.UserLoginTag}_${local.ProjectTag}_MGMT_SECURITY_GROUP_${local.RegionTag}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_MGMT_SECURITY_GROUP_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
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
	name = "${local.UserLoginTag}_${local.ProjectTag}_TEST1_SECURITY_GROUP_${local.RegionTag}"
	description = "${local.UserLoginTag}_${local.ProjectTag}_TEST1_SECURITY_GROUP_${local.RegionTag}"
	vpc_id = aws_vpc.Vpc.id
	ingress {
		description = "HTTP port"
		from_port = "80"
		protocol = "tcp"
		to_port = "80"
		cidr_blocks = [ local.InboundIPv4CidrBlock ]
	}
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_TEST1_SECURITY_GROUP_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
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
		Name = "${local.UserLoginTag}_${local.ProjectTag}_INTERNET_GW_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
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
		Name = "${local.UserLoginTag}_${local.ProjectTag}_MGMT_ROUTE_TABLE_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
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
		Name = "${local.UserLoginTag}_${local.ProjectTag}_TEST1_ROUTE_TABLE_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
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
		Name = "${local.UserLoginTag}_${local.ProjectTag}_TEST2_ROUTE_TABLE_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
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