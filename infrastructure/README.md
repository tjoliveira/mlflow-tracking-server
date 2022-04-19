# Brief explanation about Terraform files

* `apr.tf` : contains the definition of the AWS App Runner Service;
* `backend.tf`: imports the required providers;
* `data.tf`: retrieves aws account data;
* `ecr.tf`: builds a docker image and and sets up the ECR repository;
* `iam.tf`: defines identity and access management roles and policies for the aws application runner to access the ECR and S3 bucket;
* `locals.tf`: sets local variables;
* `outputs.tf`: sets the output of the infrastructure building process;
* `s3.tf`: sets up the S3 bucket;
* `variables.tf`: sets general variables.
