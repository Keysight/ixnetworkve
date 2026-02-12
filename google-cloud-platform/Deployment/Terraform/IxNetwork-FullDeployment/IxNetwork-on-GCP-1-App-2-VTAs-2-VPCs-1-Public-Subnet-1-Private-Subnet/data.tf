data "google_client_config" "current" {}

data "http" "ip" {
	url = "https://ifconfig.me/ip"
}