terraform {
	required_version = ">= 1.4.4"
}

provider "google" {
	credentials = var.Credentials
	project = var.GCP_PROJECT_NAME
	region = var.RegionName
	zone = var.GCP_ZONE_NAME
}