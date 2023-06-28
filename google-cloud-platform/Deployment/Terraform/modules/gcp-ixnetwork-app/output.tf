output "AppEth0PublicIpAddress" {
	value = {
		"address" : google_compute_address.AppEth0PublicIpAddress.address
		"address_type" : google_compute_address.AppEth0PublicIpAddress.address_type
	}
}

output "AppImage" {
	value = {
		"family" : data.google_compute_image.AppImage.family
		"name" : data.google_compute_image.AppImage.name
		"project" : data.google_compute_image.AppImage.project
	}
}