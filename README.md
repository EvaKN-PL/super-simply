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


        
