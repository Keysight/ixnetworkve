resource "google_compute_address" "AppEth0PublicIpAddress" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.AppEth0PublicIpAddressName}"
	region = local.RegionName
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "AppInstance" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.AppInstanceName}"
	zone = local.ZoneName
	machine_type = local.AppMachineType
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = true
		initialize_params {
			image = data.google_compute_image.AppImage.id
		}
	}
	allow_stopping_for_update = true
	network_interface {
		network = module.vpc.PublicVpcNetwork.self_link
		network_ip = local.AppEth0PrivateIpAddress
		subnetwork = module.vpc.PublicSubnet.self_link
		access_config {
			nat_ip = google_compute_address.AppEth0PublicIpAddress.address
			network_tier = "PREMIUM"
		}
	}
	metadata = {
		Owner = local.OwnerTag
		Project = local.ProjectTag
	}
	tags = local.AppNetworkTargetTags
	labels = {
		owner = replace(replace(local.OwnerTag, ".", "-"), "@", "-")
		project = lower(local.ProjectTag)
	}
}

resource "google_compute_address" "Agent1Eth0PublicIpAddress" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Agent1Eth0PublicIpAddressName}"
	region = local.RegionName
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "Agent1Instance" {
	name = "${local.LoginIdTag}-${local.ProjectTag}-${local.Agent1InstanceName}"
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
		network = module.vpc.PublicVpcNetwork.self_link
		network_ip = local.Agent1Eth0PrivateIpAddress
		subnetwork = module.vpc.PublicSubnet.self_link
		access_config {
			nat_ip = google_compute_address.Agent1Eth0PublicIpAddress.address
			network_tier = "PREMIUM"
		}
	}
	network_interface {
		network = module.vpc.PrivateVpcNetwork.self_link
		network_ip = local.Agent1Eth1PrivateIpAddress
		subnetwork = module.vpc.PrivateSubnet.self_link
		alias_ip_range {
			ip_cidr_range = local.Agent1Eth1PrivateIpAliases
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