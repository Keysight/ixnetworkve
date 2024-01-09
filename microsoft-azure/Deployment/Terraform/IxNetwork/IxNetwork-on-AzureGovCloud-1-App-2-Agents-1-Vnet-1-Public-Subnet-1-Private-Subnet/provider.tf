provider "azurerm" {
	client_id = var.ClientId
	client_secret = var.ClientSecret
	environment = var.Environment
	skip_provider_registration = true
	subscription_id = var.SubscriptionId
	tenant_id = var.TenantId
	features {
		resource_group {
			prevent_deletion_if_contains_resources = false
		}
	}
}