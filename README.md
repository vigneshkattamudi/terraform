# Terraform AWS EC2 Instance with Security Group

This Terraform configuration provisions an AWS EC2 instance (`t2.micro`) with a security group that allows all inbound and outbound traffic.

## Resources

- **aws_instance.terraform-ec2**: Creates an EC2 instance using the AMI ID passed via variable `ami_id`.
- **aws_security_group.allow_all**: Security group allowing all inbound and outbound traffic on all ports.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/vigneshkattamudi/terraform.git
   cd terraform
    ````

2. Create a file named `terraform.tfvars` or provide variables via CLI/environment, and specify the AMI ID:

   ```hcl
   ami_id = "ami-xxxxxxxxxxxxxx"
   ```

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Preview the resources to be created:

   ```bash
   terraform plan
   ```

5. Apply the configuration:

   ```bash
   terraform apply
   ```

6. To destroy the resources:

   ```bash
   terraform destroy
   ```

## Variables

| Name    | Description                 | Type   |
| ------- | --------------------------- | ------ |
| ami\_id | AMI ID for the EC2 instance | string |

## Notes

* The security group allows all inbound and outbound traffic. Use with caution.
* Ensure your AWS credentials are configured properly before running Terraform.

