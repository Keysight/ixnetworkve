output "AgentImage" {
	value = {
		"family" : data.google_compute_image.AgentImage.family
		"name" : data.google_compute_image.AgentImage.name
		"project" : data.google_compute_image.AgentImage.project
	}
}