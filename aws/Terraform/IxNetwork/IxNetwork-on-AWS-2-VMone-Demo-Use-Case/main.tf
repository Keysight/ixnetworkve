resource "aws_placement_group" "PlacementGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_PLACEMENT_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	strategy = local.PLACEMENTxGROUPxSTRATEGY
}

resource "aws_network_interface" "IxiaClientEth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_CLIENT_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.MgmtSubnet.id
	security_groups = [
		aws_security_group.MgmtSecurityGroup.id
	]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_CLIENT_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
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

resource "aws_instance" "IxiaClient" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxCLIENT["${local.Region}"]
	instance_type = local.IxClientInstanceType
	monitoring = local.INSTANCExMONITORING
	key_name = local.IxClientSSHKey
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_CLIENT_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	network_interface {
		network_interface_id = aws_network_interface.IxiaClientEth0.id
		device_index =  "0"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		volume_size = local.CLIENTxIMGxSIZE
		delete_on_termination = local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
	depends_on = [
		aws_instance.VMOne1
	]
}

resource "aws_eip" "MgmtElasticIp" {
	vpc = true
	network_interface = aws_network_interface.IxiaClientEth0.id
	depends_on = [
		aws_internet_gateway.InternetGw,
		aws_instance.IxiaClient
	]
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