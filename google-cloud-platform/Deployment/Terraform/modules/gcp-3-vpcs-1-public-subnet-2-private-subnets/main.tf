resource "google_compute_network" "PublicVpcNetwork" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.PublicVpcNetworkName}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "PublicSubnet" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.PublicSubnetName}"
	ip_cidr_range = local.PublicSubnetIpRange
	network = google_compute_network.PublicVpcNetwork.self_link
	region = local.RegionName
}

resource "google_compute_network" "Private1VpcNetwork" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private1VpcNetworkName}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "Private1Subnet" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private1SubnetName}"
	ip_cidr_range = local.Private1SubnetIpRange
	network = google_compute_network.Private1VpcNetwork.self_link
	region = local.RegionName
}

resource "google_compute_network" "Private2VpcNetwork" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private2VpcNetworkName}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "Private2Subnet" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private2SubnetName}"
	ip_cidr_range = local.Private2SubnetIpRange
	network = google_compute_network.Private2VpcNetwork.self_link
	region = local.RegionName
}

resource "google_compute_firewall" "PublicFirewallRule" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.PublicFirewallRuleName}"
	allow {
		protocol = "tcp"
		ports = local.PublicFirewallRulePorts
	}
	direction = local.PublicFirewallRuleDirection
	disabled = "false"
	network = google_compute_network.PublicVpcNetwork.self_link
	priority = local.PublicFirewallRulePriority
	source_ranges = local.PublicFirewallRuleSourceIpRanges
	target_tags = local.PublicFirewallRuleNetworkTargetTags
}

resource "google_compute_firewall" "ConsoleFirewallRule" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.ConsoleFirewallRuleName}"
	allow {
		protocol = "tcp"
		ports = local.ConsoleFirewallRulePorts
	}
	direction = local.ConsoleFirewallRuleDirection
	disabled = "false"
	network = google_compute_network.PublicVpcNetwork.self_link
	priority = local.ConsoleFirewallRulePriority
	source_ranges = local.ConsoleFirewallRuleSourceIpRanges
	target_tags = local.ConsoleFirewallRuleNetworkTargetTags
}

resource "google_compute_firewall" "ControlFirewallRule" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.ControlFirewallRuleName}"
	allow {
		protocol = local.ControlFirewallRulePorts
	}
	direction = local.ControlFirewallRuleDirection
	disabled = "false"
	network = google_compute_network.PublicVpcNetwork.self_link
	priority = local.ControlFirewallRulePriority
	source_tags = local.ControlFirewallRuleSourceTags
	target_tags = local.ControlFirewallRuleTargetTags
}

resource "google_compute_firewall" "Private1FirewallRule" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private1FirewallRuleName}"
	allow {
		protocol = local.Private1FirewallRulePorts
	}
	direction = local.Private1FirewallRuleDirection
	disabled = "false"
	network = google_compute_network.Private1VpcNetwork.self_link
	priority = local.Private1FirewallRulePriority
	source_ranges = local.Private1FirewallRuleSourceIpRanges
	source_tags = local.Private1FirewallRuleSourceTags
	target_tags = local.Private1FirewallRuleTargetTags
}

resource "google_compute_firewall" "Private2FirewallRule" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private2FirewallRuleName}"
	allow {
		protocol = local.Private2FirewallRulePorts
	}
	direction = local.Private2FirewallRuleDirection
	disabled = "false"
	network = google_compute_network.Private2VpcNetwork.self_link
	priority = local.Private2FirewallRulePriority
	source_ranges = local.Private2FirewallRuleSourceIpRanges
	source_tags = local.Private2FirewallRuleSourceTags
	target_tags = local.Private2FirewallRuleTargetTags
}

resource "google_compute_network_peering" "Private1VpcNetworkPeer" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private1VpcNetworkPeerName}"
	network = google_compute_network.Private1VpcNetwork.id
	peer_network = google_compute_network.Private2VpcNetwork.id
}

resource "google_compute_network_peering" "Private2VpcNetworkPeer" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Private2VpcNetworkPeerName}"
	network = google_compute_network.Private2VpcNetwork.id
	peer_network = google_compute_network.Private1VpcNetwork.id
}