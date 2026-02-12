SHELL := /bin/bash

all: init apply output

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

state:
	time terraform state list
