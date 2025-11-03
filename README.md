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
