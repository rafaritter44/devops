# Terraform

## Running through Docker

Because there's [an open issue](https://github.com/hashicorp/terraform-provider-aws/issues/39523) with Terraform's AWS provider, Mac users have to apply my Terraform files in a Linux environment. So I chose to set up a Docker container for that purpose.

Make sure that your AWS credentials are present in the ~/.aws/credentials file, which will be moved into the container.

### Building the Docker image

`$ chmod +x ./build.sh`

`$ ./build.sh`

### Running the Docker container

`$ chmod +x ./run.sh`

`$ ./run.sh`

### Applying the Terraform files

Run this inside the container:

`$ tofu init`

`$ tofu plan`

`$ tofu apply`

### Deleting the AWS resources

`$ tofu destroy`