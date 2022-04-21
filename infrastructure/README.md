# Description of Terraform files

* `apr.tf` : sets up the AWS App Runner service;
* `backend.tf`: imports the required providers;
* `data.tf`: retrieves aws account data;
* `ecr.tf`: builds a docker image and and sets up the ECR repository;
* `iam.tf`: defines identity and access management roles and policies for the Aws App Runner to access the ECR and S3 bucket;
* `locals.tf`: sets local variables;
* `outputs.tf`: sets the output of the infrastructure building process;
* `providers.tf`: sets provider configurations;
* `s3.tf`: sets up the S3 bucket;
* `variables.tf`: sets general variables.
