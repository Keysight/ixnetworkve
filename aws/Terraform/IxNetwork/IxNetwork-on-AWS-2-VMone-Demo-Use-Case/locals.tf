locals {
	AgentAmiName = var.AgentAmiName
	AgentAmiOwner = var.AgentAmiOwner
	AppAmiName = var.AppAmiName
	AppAmiOwner = var.AppAmiOwner
	AppTag = "IXNETWORK"
	AppVersion = "9.30"
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	Private1SubnetAvailabilityZone = var.Private1SubnetAvailabilityZone
	Private2SubnetAvailabilityZone = var.Private2SubnetAvailabilityZone
	ProjectTag = var.ProjectTag
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	Region = data.aws_region.current.name
	RegionTag = upper(replace(local.Region, "-", "_"))
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
}

locals {
	IxClientInstanceType = var.IxClientInstanceType
	IxClientSSHKey = var.IxClientSSHKey
	VMoneInstanceType = var.VMoneInstanceType
	PLACEMENTxGROUPxSTRATEGY = "cluster"
	INTERFACExSOURCExDESTxCHECK = false
	INSTANCExDISABLExAPIxTERMINATION = false
	INSTANCExMONITORING = false
	INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR = "stop"
	INSTANCExBLOCKxDEVICExNAME = "/dev/sda1"
	INSTANCExEBSxDELETExONxTERMINATION = true
	INSTANCExEBSxVOLUMExTYPE = "gp2"
	CLIENTxIMGxSIZE = "100"
	VMONE1xETH0xPRIVATExIPxADDRESS = "10.0.10.11"
	VMONE1xETH1xPRIVATExIPxADDRESSES = [ "10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21" ]
	VMONE2xETH0xPRIVATExIPxADDRESS = "10.0.10.12"
	VMONE2xETH1xPRIVATExIPxADDRESSES = [ "10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21" ]
}