# IxNetwork-on-AWS-1-App-2-Agents-Add-On

## Description
This deployment creates resources that will be attached to an existing network topology.

## Required Variables
```
terraform.required.auto.tfvars
```
You **MUST** uncomment all lines in this file and replace values to match your particular environment.  
Otherwise, Terraform will prompt the user to supply input arguents via cli.

## Optional Variables
```
terraform.optional.auto.tfvars
```
You **MAY** uncomment one or more lines as needed in this file and replace values to match your particular environment.

## Required Usage
```
terraform init
terraform apply -auto-approve
terraform output SshKey
terraform destroy -auto-approve
```
You **MUST** output the SSH key pair associated with the AWS instances.  
Use the **private_key_pem** material to get Windows password for the App from the AWS Console.

## Optional Usage
```
terraform validate
terraform plan
terraform state list
terraform output
```