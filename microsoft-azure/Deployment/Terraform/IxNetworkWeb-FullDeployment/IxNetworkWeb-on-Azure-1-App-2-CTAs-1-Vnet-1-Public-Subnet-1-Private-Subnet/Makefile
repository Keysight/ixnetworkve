SHELL := /bin/bash

azure: all

all: init apply ssh

clean: state destroy

version:
	time terraform version

init:
	time terraform init

validate:
	time terraform validate
	
update:
	time terraform get -update

plan:
	time terraform plan

apply:
	time terraform apply -auto-approve

destroy:
	time terraform destroy -auto-approve

output:
	time terraform output

ssh:
	time terraform output SshKey | tail -n +3 | head -n-3 | sed "s/^[ \t]*//" > .sshkey.pem
	chmod 600 .sshkey.pem

state:
	time terraform state list

connect: connect-app

connect-app:
	ssh -o StrictHostKeyChecking=no -i .sshkey.pem azure@$$(terraform output -json App | jq -r .public_ip_address)

connect-agent1:
	ssh -o StrictHostKeyChecking=no -i .sshkey.pem azure@$$(terraform output -json Agent1 | jq -r .public_ip_address)
