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

    1. Creates the VPC.

    2. Provisions the Internet Gateway and attaches it to the VPC.

    3. Defines the Public Subnet and associates it with a Route Table directing external traffic through the IGW.

2. modules/security

Focuses solely on the security layer:

    1. Creates a dedicated Security Group (SG).

    2. The SG configuration explicitly allows TCP 22 (SSH) and TCP 80 (HTTP) inbound traffic from anywhere (0.0.0.0/0), and allows all outbound traffic.


      Zapytanie zostało przetworzone

Rozumiem. Chcesz, abym w pliku README użył wyłącznie angielskich terminów do opisu struktury katalogów i plików Terraform.

Oto poprawiona sekcja, która używa angielskich opisów dla plików i katalogów:

🌟 Modular AWS Infrastructure: Single Web Server Deployment

This repository showcases a structured and reusable approach to cloud infrastructure provisioning on Amazon Web Services (AWS) using Terraform. The core philosophy here is modularity, ensuring that networking, security, and compute layers are logically separated and easily maintainable.

🏛️ Architectural Design & Flow

This architecture provisions a foundational environment, suitable for small development or testing purposes. The central component is the Virtual Private Cloud (VPC), providing network isolation for our resources.
Layer	Component	Description	Terraform Module
Networking	VPC & IGW	The backbone (10.0.0.0/16). Includes the Internet Gateway for external connectivity.	modules/vpc
Subnetting	Public Subnet	A single subnet (10.0.1.0/24) designed to host public-facing resources.	modules/vpc
Security	Security Group	An essential layer that acts as a stateful firewall for the EC2 instance, limiting exposure.	modules/security
Compute	EC2 Instance	The actual compute resource (t3.micro), running a self-installing web server.	modules/ec2

📂 Project Directory Structure

The project structure is organized modularly for better management and dependency clarity:

.
├── main.tf         # Main Configuration
├── variables.tf    # Global Variables
├── output.tf       # Main Outputs (e.g., EC2 Public IP)
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── output.tf
    ├── security/
    │   ├── main.tf
    │   └── variables.tf
    └── ec2/
        ├── main.tf
        └── variables.tf

📦 Module Breakdown

The infrastructure is broken down into three distinct modules, improving readability and future extensibility.

1. modules/vpc

Responsible for setting up the foundational network topology:

    Creates the VPC.

    Provisions the Internet Gateway and attaches it to the VPC.

    Defines the Public Subnet and associates it with a Route Table directing external traffic through the IGW.

2. modules/security

Focuses solely on the security layer:

    Creates a dedicated Security Group (SG).

    The SG configuration explicitly allows TCP 22 (SSH) and TCP 80 (HTTP) inbound traffic from anywhere (0.0.0.0/0), and allows all outbound traffic.

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
