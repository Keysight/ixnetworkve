terraform {
	backend "remote" { 
		hostname = "cloudist.scalr.io" 
		organization = "GCP" 

		workspaces { 
			name = "IxNetwork-on-GCP-1-App-2-CTAs-3-VPCs-1-Public-Subnet-2-Private-Subnets" 
		} 
	}
}