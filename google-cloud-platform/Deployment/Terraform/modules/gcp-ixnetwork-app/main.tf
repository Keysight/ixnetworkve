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
		network = data.google_compute_network.AppEth0VpcNetwork.self_link
		network_ip = local.AppEth0PrivateIpAddress
		subnetwork = data.google_compute_subnetwork.AppEth0Subnet.self_link
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