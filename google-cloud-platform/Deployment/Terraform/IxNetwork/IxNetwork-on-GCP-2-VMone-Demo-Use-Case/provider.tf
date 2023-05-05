terraform {
	required_version = ">= 1.4.4"
}

provider "google" {
	credentials = var.Credentials
	project = var.GCP_PROJECT_NAME
	region = var.GCP_REGION_NAME
	zone = var.GCP_ZONE_NAME
}