# IxVM-on-AWS-2-Agents-1-VPC-1-Public-Subnet-2-Private-Subnets

## Description
This deployment creates a topology with a single virtual private cloud having a single public facing subnet and two private subnets.

## Optional Variables
```
terraform.aws.auto.tfvars
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
```