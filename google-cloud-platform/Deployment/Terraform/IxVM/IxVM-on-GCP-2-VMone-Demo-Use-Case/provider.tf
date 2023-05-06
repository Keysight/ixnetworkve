terraform {
	required_version = ">= 1.4.4"
}

provider "google" {
	credentials = var.Credentials
	project = var.ProjectId
	region = var.RegionName
	zone = var.ZoneName
}