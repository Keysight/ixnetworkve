output "AppEth0PublicIpAddress" {
	value = {
		"fqdn" : module.App.Eth0PublicIpAddress.fqdn
		"ip_address" : module.App.Eth0PublicIpAddress.ip_address
	}
}

output "AppInstance" {
	value = {
		"size" : module.App.Instance.size
	}
}

output "ResourceGroup" {
	value = {
		"location" : azurerm_resource_group.ResourceGroup.location
		"name" : azurerm_resource_group.ResourceGroup.name
	}
}

output "SshKey" {
	sensitive = true
	value = {
		"private_key_pem" : tls_private_key.SshKey.private_key_pem
	}
}

output "Subscription" {
	sensitive   = true
	value = {
		"display_name" : data.azurerm_subscription.current.display_name
		"subscription_id" : data.azurerm_subscription.current.subscription_id
	}
}

output "Subscriptions" {
	sensitive   = true
	value = {
		"available.display_name" : data.azurerm_subscriptions.available.subscriptions[*].display_name
		"available.subscription_id" : data.azurerm_subscriptions.available.subscriptions[*].subscription_id
	}
}