data "google_client_config" "current" {}

data "google_compute_machine_types" "Agent" {
	filter = "name = ${local.AgentMachineType}"
	zone = data.google_client_config.current.zone
}

data "http" "ip" {
	url = "https://ifconfig.me/ip"
}
