output "InternetGw" {
	value = aws_internet_gateway.InternetGw
}

output "PrivateSecurityGroup" {
	value = {
		"id" : aws_security_group.PrivateSecurityGroup.id
	}
}

output "Private1Subnet" {
	value = {
		"availability_zone" : aws_subnet.Private1Subnet.availability_zone
		"id" : aws_subnet.Private1Subnet.id
	}
}

output "Private2Subnet" {
	value = {
		"availability_zone" : aws_subnet.Private2Subnet.availability_zone
		"id" : aws_subnet.Private2Subnet.id
	}
}

output "PublicSecurityGroup" {
	value = {
		"id" : aws_security_group.PublicSecurityGroup.id
	}
}

output "PublicSubnet" {
	value = {
		"availability_zone" : aws_subnet.PublicSubnet.availability_zone
		"id" : aws_subnet.PublicSubnet.id
	}
}

output "Vpc" {
	value = {
		"assign_generated_ipv6_cidr_block" : aws_vpc.Vpc.assign_generated_ipv6_cidr_block
		"cidr_block" : aws_vpc.Vpc.cidr_block
		"enable_dns_hostnames" : aws_vpc.Vpc.enable_dns_hostnames
		"enable_dns_support" : aws_vpc.Vpc.enable_dns_support
		"id" : aws_vpc.Vpc.id
		"instance_tenancy" : aws_vpc.Vpc.instance_tenancy
		"tags" : aws_vpc.Vpc.tags
	}
}