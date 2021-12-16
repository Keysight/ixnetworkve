variable "AzureSubscriptionId" {
	type = string
	default = "00000000-0000-0000-0000-00000000000"
}

variable "AzureResourceGroupName" {
	type = string
	default = "Ixia_VE_Azure_9.10"
}

variable "ImageResourceGroupName" {
	type = string
	default = "Ixia_VE_Azure_9.10"
}

variable "PageBlobsStorageAccountName" {
	type = string
	default = "Ixia_VE_Page_Blobs"
}

variable "DiagnosticsStorageAccountName" {
	type = string
	default = "Ixia_VE_Diagnostics"
}

variable "MgmtSecurityRuleSourceIpPrefix" {
	type = string
	default = "42.42.42.42/32"
}

variable "IxiaClientPageBlobName" {
	type = string
	default = "IxLoad_VE_Client_9.10.vhd"
}

variable "IxiaClientVmSize" {
	type = string
	default = "Standard_F4s"
	validation {
		condition = can(regex("Standard_F4s", var.IxiaClientVmSize)) || can(regex("Standard_F4s_v2", var.IxiaClientVmSize))
		error_message = "IxiaClientVmSize must be one of (Standard_F4s | Standard_F4s_v2) sizes."
	}
}

variable  "VirtualTestApplianceImageName" {
	type = string
	default = "Ixia_Virtual_Test_Appliance_9.10"
}

variable "VirtualTestApplianceVmSize" {
	type = string
	default = "Standard_F16s"
	validation {
		condition = can(regex("Standard_F16s", var.VirtualTestApplianceVmSize)) || can(regex("Standard_F8s", var.VirtualTestApplianceVmSize)) || can(regex("Standard_F4s", var.VirtualTestApplianceVmSize))
		error_message = "VirtualTestApplianceVmSize must be one of (Standard_F16s | Standard_F8s | Standard_F4s) sizes."
	}
}

variable "OptionalVMPrefix" {
	type = string
	default = "Ixia"
}

variable "UserEmailTag" {
	type = string
	default = "Optional-Email-Tag"
}

variable "UserProjectTag" {
	type = string
	default = "Optional-Project-Tag"
}

variable "UserOptionsTag" {
	type = string
	default = "MANUAL"
}