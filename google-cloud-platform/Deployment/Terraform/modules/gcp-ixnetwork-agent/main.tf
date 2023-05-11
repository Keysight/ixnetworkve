resource "google_compute_address" "AgentEth0PublicIpAddress" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.AgentEth0PublicIpAddressName}"
	region = local.RegionName
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "AgentInstance" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.AgentInstanceName}"
	zone = local.ZoneName
	machine_type = local.AgentMachineType
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = true
		initialize_params {
			image = data.google_compute_image.AgentImage.id
		}
	}
	allow_stopping_for_update = true
	enable_display = true
	network_interface {
		network = data.google_compute_network.AgentEth0VpcNetwork.self_link
		network_ip = local.AgentEth0PrivateIpAddress
		subnetwork = data.google_compute_subnetwork.AgentEth0Subnet.self_link
		access_config {
			nat_ip = google_compute_address.AgentEth0PublicIpAddress.address
			network_tier = "PREMIUM"
		}
	}
	network_interface {
		network = data.google_compute_network.AgentEth1VpcNetwork.self_link
		network_ip = local.AgentEth1PrivateIpAddress
		subnetwork = data.google_compute_subnetwork.AgentEth1Subnet.self_link
		alias_ip_range {
			ip_cidr_range = local.AgentEth1PrivateIpAliases
		}
	}
	metadata = {
		Owner = local.OwnerTag
		Project = local.ProjectTag
		serial-port-enable = local.AgentSerialPortEnable
	}
	tags = local.AgentNetworkTargetTags
	labels = {
		owner = replace(replace(local.OwnerTag, ".", "-"), "@", "-")
		project = lower(local.ProjectTag)
	}
}