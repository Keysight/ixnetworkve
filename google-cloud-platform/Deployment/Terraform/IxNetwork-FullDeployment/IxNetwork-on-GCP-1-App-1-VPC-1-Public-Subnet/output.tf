output "App" {
	value = {
		architecture = module.App.Instance.architecture 
		can_ip_forward = module.App.Instance.can_ip_forward
		cpu_platform = module.App.Instance.cpu_platform
		current_status = module.App.Instance.current_status
		eth0 = {
			public_ip_address = {
				address = module.App.Eth0PublicIpAddress.address
				address_type = module.App.Eth0PublicIpAddress.address_type
			}
		}
		image = {
			name = module.App.Image.name
			project = module.App.Image.project
		}
		instance_id = module.App.Instance.instance_id
		machine = {
			description = data.google_compute_machine_types.App.machine_types.0.description
			guest_cpus = data.google_compute_machine_types.App.machine_types.0.guest_cpus
			is_shared_cpus = data.google_compute_machine_types.App.machine_types.0.is_shared_cpus
			machine_type = module.App.Instance.machine_type
			memory_mb = data.google_compute_machine_types.App.machine_types.0.memory_mb
		}
		name = module.App.Instance.name
		network_ip = module.App.Instance.network_ip
		project = module.App.Instance.project
		zone = module.App.Instance.zone
	}
}

output "PublicVpcNetwork" {
	value = {
		mtu = module.Vpc.PublicVpcNetwork.mtu
		name = module.Vpc.PublicVpcNetwork.name
	}
}
