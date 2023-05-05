locals {
	AgentCustomImageProjectId = var.AgentCustomImageProjectId
	AgentCustomImageFamilyName = var.AgentCustomImageFamilyName
	AppCustomImageProjectId = var.AppCustomImageProjectId
	AppCustomImageFamilyName = var.AppCustomImageFamilyName
	LoginIdTag = var.LoginIdTag
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges
	RegionName = var.RegionName
}

locals {
	GCP_PROJECT_NAME = var.GCP_PROJECT_NAME
	GCP_ZONE_NAME = var.GCP_ZONE_NAME
	GCP_OWNER_TAG = var.GCP_OWNER_TAG
	GCP_PROJECT_TAG = var.GCP_PROJECT_TAG
	GCP_OPTIONS_TAG = "MANUAL"
	GCP_CLIENT_INSTANCE_NAME = "ixnetwork-client-01"
	GCP_CLIENT_CUSTOM_IMAGE_PROJECT_NAME = "ixvm-261016"
	GCP_CLIENT_CUSTOM_IMAGE_FAMILY_NAME = "ixnetwork-cloud-gcp-9-30-2212-7"
	GCP_CLIENT_MACHINE_TYPE = var.GCP_CLIENT_MACHINE_TYPE
	GCP_CLIENT_IFACE_ETH0_PRIVATE_IP_ADDRESS = "10.0.10.10"
	GCP_CLIENT_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME = "ixnetwork-client-01-eth0-ip-addr"
	GCP_CLIENT_NETWORK_TARGET_TAGS = [
		"ixnetwork-client"
	]
	GCP_VMONE1_INSTANCE_NAME = "ixnetwork-vmone-01"
	GCP_VMONE2_INSTANCE_NAME = "ixnetwork-vmone-02"
	GCP_VMONE_SERIAL_PORT_ENABLE = "true"
	GCP_VMONE_CUSTOM_IMAGE_PROJECT_NAME = "ixvm-261016"
	GCP_VMONE_CUSTOM_IMAGE_FAMILY_NAME = "ixia-virtual-test-appliance-9-30-0-209"
	GCP_VMONE_MACHINE_TYPE = var.GCP_VMONE_MACHINE_TYPE
	GCP_VMONE1_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME = "ixnetwork-vmone-01-eth0-ip-addr"
	GCP_VMONE1_IFACE_ETH0_PRIVATE_IP_ADDRESS = "10.0.10.11"
	GCP_VMONE1_IFACE_ETH1_PRIVATE_IP_ADDRESS = "10.0.2.15"
	GCP_VMONE1_IFACE_ETH1_PRIVATE_IP_ALIASES = "/28"
	GCP_VMONE2_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME = "ixnetwork-vmone-02-eth0-ip-addr"
	GCP_VMONE2_IFACE_ETH0_PRIVATE_IP_ADDRESS = "10.0.10.12"
	GCP_VMONE2_IFACE_ETH1_PRIVATE_IP_ADDRESS = "10.0.3.15"
	GCP_VMONE2_IFACE_ETH1_PRIVATE_IP_ALIASES = "/28"
	GCP_VMONE_NETWORK_TARGET_TAGS = [
		"ixnetwork-vmone"
	]
}