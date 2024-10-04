---
# EC2 Server Provisioning with Terraform

This project automates the provisioning of EC2 servers on AWS using Terraform. It allows users to easily define instance parameters like name, type, and SSH key, making the process of spinning up multiple EC2 instances both efficient and scalable.

## Features

- Provision multiple EC2 instances with customizable instance types.
- Define instance parameters such as server name, instance type, and key pair using variables.
- Automatically assign public IP addresses to instances.
- Easily tag EC2 instances for better organization and management.

## Project Structure

- **`main.tf`**: Contains the primary configuration file for defining EC2 instances and setting up the AWS provider.
- **`modules/instances/`**: Terraform module that defines the EC2 instances with user-defined specifications.

## Prerequisites

- AWS account with proper IAM permissions.
- AWS credentials configured on your local environment.
- Terraform installed on your system. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/arakashnawin/terraform-provision-servers.git
cd terraform-provision-servers
```

### 2. Configure the AWS Provider

Ensure your AWS credentials and region are properly configured. This example uses the `ap-south-1` region, but you can modify it in the `main.tf` file if needed.

### 3. Modify Variables

Edit the `main.tf` file to specify the EC2 instances you want to provision. You can define instance names and types in the `myhosts` variable, as shown below:

```hcl
variable "myhosts" {
  type = map
  default = {
    K8sMaster  = "t2.medium"
    K8sWorker1 = "t2.micro"
    K8sWorker2 = "t2.micro"
  }
}
```

### 4. Run Terraform Commands

- **Initialize** the working directory:

  ```bash
  terraform init
  ```

- **Plan** the infrastructure changes:

  ```bash
  terraform plan
  ```

- **Apply** the changes to provision the EC2 instances:

  ```bash
  terraform apply
  ```

### 5. Customize Module Parameters

The `modules/instances/` directory contains a module that allows for further customization of instance parameters such as AMI ID, instance type, key pair (PEM file), EBS volume size, and server name. Adjust these values in the module's variables as needed:

```hcl
variable "amiid" {
  default = "ami-08e5424edfe926b43"
}

variable "type" {
  default = "t2.micro"
}

variable "pemfile" { 
  default = "JanFeb24"
}

variable "volsize" {
  type = number
  default = 8
}

variable "servername" {
  default = "demoserver"
}
```

## Author

**Akash Nawin**  
Email: akashnawin18.ia@gmail.com  
Phone: +91-9916818558

---

Feel free to reach out for any questions or contributions to this project. Contributions are always welcome!
