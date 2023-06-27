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

resource "google_compute_network" "PrivateVpcNetwork" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.PrivateVpcNetworkName}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "PrivateSubnet" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.PrivateSubnetName}"
	ip_cidr_range = local.PrivateSubnetIpRange
	network = google_compute_network.PrivateVpcNetwork.self_link
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

resource "google_compute_firewall" "PrivateFirewallRule" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.PrivateFirewallRuleName}"
	allow {
		protocol = local.PrivateFirewallRulePorts
	}
	direction = local.PrivateFirewallRuleDirection
	disabled = "false"
	network = google_compute_network.PrivateVpcNetwork.self_link
	priority = local.PrivateFirewallRulePriority
	source_ranges = local.PrivateFirewallRuleSourceIpRanges
	source_tags = local.PrivateFirewallRuleSourceTags
	target_tags = local.PrivateFirewallRuleTargetTags
}