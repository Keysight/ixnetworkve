SHELL := /bin/bash

aws: install all

all: init apply output

clean: state destroy

install:
ifeq ($(shell grep "^ID=" /etc/*elease | cut -d "=" -f 2| sed -e 's/^"//' -e 's/"$$//' 2> /dev/null), amzn)
ifeq ($(shell command -v terraform 2> /dev/null),)
	sudo yum install -y yum-utils
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
	sudo yum -y install terraform
endif
endif

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

ena-express:
	chmod +x ./CloudShell/aws-enable-ena-express.sh
	./CloudShell/aws-enable-ena-express.sh $$(terraform output -json Agent1 | jq -r .id) $$(terraform output -json AvailabilityZones | jq -r .region)

state:
	time terraform state list

connect: connect-app

connect-app:
	chmod +x ./CloudShell/connect.sh
	./CloudShell/connect.sh -i $$(terraform output -json App | jq -r .eth0.eip.public_ip)

connect-agent1:
	chmod +x ./CloudShell/connect.sh
	./CloudShell/connect.sh -i $$(terraform output -json Agent1 | jq -r .eth0.eip.public_ip)

connect-agent2:
	chmod +x ./CloudShell/connect.sh
	./CloudShell/connect.sh -i $$(terraform output -json Agent2 | jq -r .eth0.eip.public_ip)
