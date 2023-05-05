resource "google_compute_network" "GCP_MGMT_VPC_NETWORK" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_MGMT_VPC_NETWORK_NAME}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "GCP_MGMT_SUBNET" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_MGMT_SUBNET_NAME}"
	ip_cidr_range = local.GCP_MGMT_SUBNET_IP_RANGE
	network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
	region = local.GCP_REGION_NAME
}

resource "google_compute_network" "GCP_TEST1_VPC_NETWORK" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST1_VPC_NETWORK_NAME}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "GCP_TEST1_SUBNET" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST1_SUBNET_NAME}"
	ip_cidr_range = local.GCP_TEST1_SUBNET_IP_RANGE
	network = google_compute_network.GCP_TEST1_VPC_NETWORK.self_link
	region = local.GCP_REGION_NAME
}

resource "google_compute_network" "GCP_TEST2_VPC_NETWORK" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST2_VPC_NETWORK_NAME}"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "GCP_TEST2_SUBNET" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST2_SUBNET_NAME}"
	ip_cidr_range = local.GCP_TEST2_SUBNET_IP_RANGE
	network = google_compute_network.GCP_TEST2_VPC_NETWORK.self_link
	region = local.GCP_REGION_NAME
}

resource "google_compute_firewall" "GCP_MGMT_FIREWALL_RULE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_MGMT_FIREWALL_RULE_NAME}"
	allow {
		protocol = "tcp"
		ports = local.GCP_MGMT_FIREWALL_RULE_PORTS
	}
	direction = local.GCP_MGMT_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
	priority = local.GCP_MGMT_FIREWALL_RULE_PRIORITY
	source_ranges = local.GCP_MGMT_FIREWALL_RULE_SOURCE_IP_RANGES
	target_tags = local.GCP_MGMT_FIREWALL_RULE_NETWORK_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_CONSOLE_FIREWALL_RULE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_CONSOLE_FIREWALL_RULE_NAME}"
	allow {
		protocol = "tcp"
		ports = local.GCP_CONSOLE_FIREWALL_RULE_PORTS
	}
	direction = local.GCP_CONSOLE_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
	priority = local.GCP_CONSOLE_FIREWALL_RULE_PRIORITY
	source_ranges = local.GCP_CONSOLE_FIREWALL_RULE_SOURCE_IP_RANGES
	target_tags = local.GCP_CONSOLE_FIREWALL_RULE_NETWORK_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_CONTROL_FIREWALL_RULE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_CONTROL_FIREWALL_RULE_NAME}"
	allow {
		protocol = local.GCP_CONTROL_FIREWALL_RULE_PORTS
	}
	direction = local.GCP_CONTROL_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
	priority = local.GCP_CONTROL_FIREWALL_RULE_PRIORITY
	source_tags = local.GCP_CONTROL_FIREWALL_RULE_SOURCE_TAGS
	target_tags = local.GCP_CONTROL_FIREWALL_RULE_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_TEST1_FIREWALL_RULE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST1_FIREWALL_RULE_NAME}"
	allow {
		protocol = local.GCP_TEST1_FIREWALL_RULE_PORTS
	}
	direction = local.GCP_TEST1_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = google_compute_network.GCP_TEST1_VPC_NETWORK.self_link
	priority = local.GCP_TEST1_FIREWALL_RULE_PRIORITY
	source_ranges = local.GCP_TEST1_FIREWALL_RULE_SOURCE_IP_RANGES
	source_tags = local.GCP_TEST1_FIREWALL_RULE_SOURCE_TAGS
	target_tags = local.GCP_TEST1_FIREWALL_RULE_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_TEST2_FIREWALL_RULE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST2_FIREWALL_RULE_NAME}"
	allow {
		protocol = local.GCP_TEST2_FIREWALL_RULE_PORTS
	}
	direction = local.GCP_TEST2_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = google_compute_network.GCP_TEST2_VPC_NETWORK.self_link
	priority = local.GCP_TEST2_FIREWALL_RULE_PRIORITY
	source_ranges = local.GCP_TEST2_FIREWALL_RULE_SOURCE_IP_RANGES
	source_tags = local.GCP_TEST2_FIREWALL_RULE_SOURCE_TAGS
	target_tags = local.GCP_TEST2_FIREWALL_RULE_TARGET_TAGS
}

resource "google_compute_network_peering" "GCP_TEST1_VPC_NETWORK_PEER" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST1_VPC_NETWORK_PEER_NAME}"
	network = google_compute_network.GCP_TEST1_VPC_NETWORK.id
	peer_network = google_compute_network.GCP_TEST2_VPC_NETWORK.id
}

resource "google_compute_network_peering" "GCP_TEST2_VPC_NETWORK_PEER" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_TEST2_VPC_NETWORK_PEER_NAME}"
	network = google_compute_network.GCP_TEST2_VPC_NETWORK.id
	peer_network = google_compute_network.GCP_TEST1_VPC_NETWORK.id
}