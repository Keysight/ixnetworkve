output "AgentImage" {
	value = {
		"family" : module.agent.AgentImage.family
		"name" : module.agent.AgentImage.name
		"project" : module.agent.AgentImage.project
	}
}