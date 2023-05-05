resource "google_compute_address" "AppEth0PublicIpAddress" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_CLIENT_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME}"
	region = local.GCP_REGION_NAME
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "GCP_CLIENT_INSTANCE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_CLIENT_INSTANCE_NAME}"
	zone = local.GCP_ZONE_NAME
	machine_type = "zones/${local.GCP_ZONE_NAME}/machineTypes/${local.GCP_CLIENT_MACHINE_TYPE}"
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = "true"
		initialize_params {
			image = "projects/${local.GCP_CLIENT_CUSTOM_IMAGE_PROJECT_NAME}/global/images/family/${local.GCP_CLIENT_CUSTOM_IMAGE_FAMILY_NAME}"
		}
	}
	network_interface {
		network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
		network_ip = local.GCP_CLIENT_IFACE_ETH0_PRIVATE_IP_ADDRESS
		subnetwork = google_compute_subnetwork.GCP_MGMT_SUBNET.self_link
		access_config {
			nat_ip = google_compute_address.AppEth0PublicIpAddress.address
			network_tier = "PREMIUM"
		}
	}
	metadata = {
		Owner = local.GCP_OWNER_TAG
		Project = local.GCP_PROJECT_TAG
		Options = local.GCP_OPTIONS_TAG
	}
	tags = local.GCP_CLIENT_NETWORK_TARGET_TAGS
	labels = {
		owner = replace(replace(local.GCP_OWNER_TAG, ".", "-"), "@", "-")
		project = lower(local.GCP_PROJECT_TAG)
		options = lower(local.GCP_OPTIONS_TAG)
	}
}

resource "google_compute_address" "GCP_VMONE1_IFACE_ETH0_PUBLIC_IP_ADDRESS" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_VMONE1_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME}"
	region = local.GCP_REGION_NAME
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "GCP_VMONE1_INSTANCE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_VMONE1_INSTANCE_NAME}"
	zone = local.GCP_ZONE_NAME
	machine_type = "zones/${local.GCP_ZONE_NAME}/machineTypes/${local.GCP_VMONE_MACHINE_TYPE}"
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = "true"
		initialize_params {
			image = "projects/${local.GCP_VMONE_CUSTOM_IMAGE_PROJECT_NAME}/global/images/family/${local.GCP_VMONE_CUSTOM_IMAGE_FAMILY_NAME}"
		}
	}
	allow_stopping_for_update = "true"
	enable_display = "true"
	network_interface {
		network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
		network_ip = local.GCP_VMONE1_IFACE_ETH0_PRIVATE_IP_ADDRESS
		subnetwork = google_compute_subnetwork.GCP_MGMT_SUBNET.self_link
		access_config {
			nat_ip = google_compute_address.GCP_VMONE1_IFACE_ETH0_PUBLIC_IP_ADDRESS.address
			network_tier = "PREMIUM"
		}
	}
	network_interface {
		network = google_compute_network.GCP_TEST1_VPC_NETWORK.self_link
		network_ip = local.GCP_VMONE1_IFACE_ETH1_PRIVATE_IP_ADDRESS
		subnetwork = google_compute_subnetwork.GCP_TEST1_SUBNET.self_link
		access_config {
			network_tier = "PREMIUM"
		}
		alias_ip_range {
			ip_cidr_range = local.GCP_VMONE1_IFACE_ETH1_PRIVATE_IP_ALIASES
		}
	}
	metadata = {
		Owner = local.GCP_OWNER_TAG
		Project = local.GCP_PROJECT_TAG
		Options = local.GCP_OPTIONS_TAG
		serial-port-enable = local.GCP_VMONE_SERIAL_PORT_ENABLE
	}
	tags = local.GCP_VMONE_NETWORK_TARGET_TAGS
	labels = {
		owner = replace(replace(local.GCP_OWNER_TAG, ".", "-"), "@", "-")
		project = lower(local.GCP_PROJECT_TAG)
		options = lower(local.GCP_OPTIONS_TAG)
	}
}

resource "google_compute_address" "GCP_VMONE2_IFACE_ETH0_PUBLIC_IP_ADDRESS" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_VMONE2_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME}"
	region = local.GCP_REGION_NAME
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "GCP_VMONE2_INSTANCE" {
	name = "${local.GCP_LOGIN_ID_TAG}-${local.GCP_PROJECT_TAG}-${local.GCP_VMONE2_INSTANCE_NAME}"
	zone = local.GCP_ZONE_NAME
	machine_type = "zones/${local.GCP_ZONE_NAME}/machineTypes/${local.GCP_VMONE_MACHINE_TYPE}"
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = "true"
		initialize_params {
			image = "projects/${local.GCP_VMONE_CUSTOM_IMAGE_PROJECT_NAME}/global/images/family/${local.GCP_VMONE_CUSTOM_IMAGE_FAMILY_NAME}"
		}
	}
	allow_stopping_for_update = "true"
	enable_display = "true"
	network_interface {
		network = google_compute_network.GCP_MGMT_VPC_NETWORK.self_link
		network_ip = local.GCP_VMONE2_IFACE_ETH0_PRIVATE_IP_ADDRESS
		subnetwork = google_compute_subnetwork.GCP_MGMT_SUBNET.self_link
		access_config {
			nat_ip = google_compute_address.GCP_VMONE2_IFACE_ETH0_PUBLIC_IP_ADDRESS.address
			network_tier = "PREMIUM"
		}
	}
	network_interface {
		network = google_compute_network.GCP_TEST2_VPC_NETWORK.self_link
		network_ip = local.GCP_VMONE2_IFACE_ETH1_PRIVATE_IP_ADDRESS
		subnetwork = google_compute_subnetwork.GCP_TEST2_SUBNET.self_link
		access_config {
			network_tier = "PREMIUM"
		}
		alias_ip_range {
			ip_cidr_range = local.GCP_VMONE2_IFACE_ETH1_PRIVATE_IP_ALIASES
		}
	}
	metadata = {
		Owner = local.GCP_OWNER_TAG
		Project = local.GCP_PROJECT_TAG
		Options = local.GCP_OPTIONS_TAG
		serial-port-enable = local.GCP_VMONE_SERIAL_PORT_ENABLE
	}
	tags = local.GCP_VMONE_NETWORK_TARGET_TAGS
	labels = {
		owner = replace(replace(local.GCP_OWNER_TAG, ".", "-"), "@", "-")
		project = lower(local.GCP_PROJECT_TAG)
		options = lower(local.GCP_OPTIONS_TAG)
	}
}