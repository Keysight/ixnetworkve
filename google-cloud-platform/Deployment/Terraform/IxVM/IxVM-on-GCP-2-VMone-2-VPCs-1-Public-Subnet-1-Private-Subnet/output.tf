output "AgentImage" {
	value = {
		"family" : module.agent1.AgentImage.family
		"name" : module.agent1.AgentImage.name
		"project" : module.agent1.AgentImage.project
	}
}