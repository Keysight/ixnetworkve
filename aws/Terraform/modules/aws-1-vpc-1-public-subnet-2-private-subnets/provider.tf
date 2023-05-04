terraform {
	required_version = ">= 1.4.4"
}

provider "aws" {
	region = var.Region
	max_retries = var.ApiMaxRetries
}