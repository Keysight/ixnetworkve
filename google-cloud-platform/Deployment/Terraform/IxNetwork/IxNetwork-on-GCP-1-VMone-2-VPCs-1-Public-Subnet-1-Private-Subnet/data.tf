data "google_compute_image" "AppImage" {
	family = local.AppCustomImageFamilyName
	project = local.AppCustomImageProjectId
}

data "google_compute_image" "AgentImage" {
	family = local.AgentCustomImageFamilyName
	project = local.AgentCustomImageProjectId
}