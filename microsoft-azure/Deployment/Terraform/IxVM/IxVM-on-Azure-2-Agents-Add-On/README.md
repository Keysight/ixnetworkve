# IxVM-on-Azure-2-Agents-Add-On

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
terraform.azure.auto.tfvars
terraform.optional.auto.tfvars
```
You **MAY** uncomment one or more lines as needed in these files and replace values to match your particular environment.

## Required Usage
```
terraform init
terraform apply -auto-approve
terraform destroy -auto-approve
```

## Optional Usage
```
terraform validate
terraform plan
terraform state list
terraform output
terraform output SshKey | tail -n +3 | head -n-3 | sed "s/^[ \t]*//" > SshKey.pem
```