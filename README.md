# super-simply
This repository contains Terraform code to provision a basic, highly modular web server infrastructure on Amazon Web Services (AWS). This project follows best practices by leveraging Terraform Modules for clarity, reusability, and separation of concerns (networking, security, and compute).


🌟 Architecture Overview

<img width="673" height="417" alt="sUPER SIMPLY drawio" src="https://github.com/user-attachments/assets/dc044c15-38bd-4c65-ad0c-fb5654931377" />

| Layer       | Component        | Description                                                                                      | Terraform Module |
|--------------|------------------|--------------------------------------------------------------------------------------------------|------------------|
| Networking   | VPC & IGW        | The backbone (10.0.0.0/16). Includes the Internet Gateway for external connectivity.             | modules/vpc      |
| Subnetting   | Public Subnet    | A single subnet (10.0.1.0/24) designed to host public-facing resources.                         | modules/vpc      |
| Security     | Security Group   | An essential layer that acts as a stateful firewall for the EC2 instance, limiting exposure.     | modules/security |
| Compute      | EC2 Instance     | The actual compute resource (t3.micro), running a self-installing web server.                   | modules/ec2      |

<img width="708" height="347" alt="super_simply_diagram" src="https://github.com/user-attachments/assets/b4c867e0-83f8-4c63-805b-ca0a65201d69" />

📦 Module Breakdown

The infrastructure is broken down into three distinct modules, improving readability and future extensibility.

1. modules/vpc

Responsible for setting up the foundational network topology:

    1. Create the VPC.

    2. Provisions the Internet Gateway and attaches it to the VPC.

    3. Defines the Public Subnet and associates it with a Route Table directing external traffic through the IGW.

2. modules/security

Focuses solely on the security layer:

    1. Creates a dedicated Security Group (SG).

    2. The SG configuration explicitly allows TCP 22 (SSH) and TCP 80 (HTTP) inbound traffic from anywhere (0.0.0.0/0), and allows all outbound traffic.

3. modules/ec2

Handles the deployment of the compute resource:

    1. Deploys the aws_instance into the Public Subnet.

    2. Attaches the necessary SSH Key Pair and the outputted Security Group ID.

    3. Employs user_data to automatically install and start the Nginx web service upon launch.      


⚙️ Prerequisites & Configuration

Before execution, ensure your environment meets these requirements:

    1. Terraform CLI (v1.0+): Installed and accessible in your path.

    2. AWS CLI: Configured with sufficient access permissions (keys in ~/.aws/credentials).

    3. SSH Key Pair: An SSH key must be created in your target AWS region and its name specified in terraform.tfvars.

    4. .gitignore: Ensure your sensitive file (terraform.tfvars) is excluded from version control.

🛠️ Deployment Steps (Terraform Workflow)
1. Configure Variables

Create a file named terraform.tfvars in the root directory and populate it with your environment-specific values.
```
# terraform.tfvars
# Environment Configuration
aws_region          = "eu-central-1" 
key_name            = "your-existing-ssh-key-name" # REQUIRED: Name of the key pair in AWS
instance_type       = "t3.micro" 

# Networking Configuration
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24"] 
```
Świetny pomysł! Plik README na GitHub jest niezbędny do udokumentowania i wyjaśnienia projektu.

Jako Lucek, przygotowałem dla Ciebie kompleksowy plik README w języku angielskim, który dokładnie opisuje Twoją modularną infrastrukturę AWS stworzoną za pomocą Terraform.

🚀 AWS Web Server Infrastructure Deployment using Terraform Modules

This repository contains Terraform code to provision a basic, highly modular web server infrastructure on Amazon Web Services (AWS). This project follows best practices by leveraging Terraform Modules for clarity, reusability, and separation of concerns (networking, security, and compute).

💡 Architecture Overview

The deployed infrastructure consists of a single web server instance accessible from the internet, placed within a custom Virtual Private Cloud (VPC).
Component	Description	Terraform Module
VPC	Isolated network container (10.0.0.0/16) with an Internet Gateway (IGW).	vpc
Networking	One Public Subnet and necessary Route Tables for internet access.	vpc
Security Group	Firewall for the EC2 instance, allowing inbound traffic on TCP 22 (SSH) and TCP 80 (HTTP).	security
EC2 Instance	A single t3.micro instance running Amazon Linux 2023 with Nginx installed via user_data.	ec2

prerequisites

Before you begin, ensure you have the following tools installed and configured:

    Terraform CLI: Version 1.0 or higher.

    AWS CLI: Configured with credentials that have permissions to create the necessary AWS resources (e.g., AdministratorAccess policy for simplicity).

    SSH Key Pair: A key pair must be generated in the target AWS region. The name of this key must be provided in the terraform.tfvars file.

🛠️ Deployment Steps (Terraform Workflow)

Follow these steps from the root directory of the project to deploy the infrastructure.

1. Configure Variables

Create a file named terraform.tfvars in the root directory and populate it with your environment-specific values.
Terraform

# terraform.tfvars
# Environment Configuration
aws_region          = "eu-central-1" 
key_name            = "your-existing-ssh-key-name" # REQUIRED: Name of the key pair in AWS
instance_type       = "t3.micro" 

# Networking Configuration
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24"]

2. Initialization

This command downloads the AWS provider and initializes the local modules (vpc, security, ec2).

`terraform init`
