terraform {
	required_version = ">= 1.4.4"
	required_providers {
		azurerm = {
			source  = "hashicorp/azurerm"
			version = ">= 3.56.0"
		}
	}
}