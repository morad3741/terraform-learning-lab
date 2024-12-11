# Building AWS Infrastructure with Terraform: A Learning Project
![Terraform execrise drawio (3)](https://github.com/user-attachments/assets/36186e46-b29d-473f-aaac-4045d2c3cadf)
## Overview

As part of my journey to learn Terraform, I created this exercise to train with the deployment of essential AWS resources, including EC2 instances, a load balancer, and the associated networking setup. This project also highlights the use of modularity and remote state management to ensure scalability, collaboration, and maintainability.

### Key Features

- Experimentation with automated provisioning of resources using Terraform.
- practice with scalable EC2 instances using user data scripts.
- Exploring load balancing concepts for high availability.
- Learning modular design for flexibility and reuse.

Practicing remote state management for team collaboration.Project Components

### 1. **Main Configuration** (`main.tf`)

- Defines the overall structure of the Terraform project.

### 2. **Variables** (`variables.tf`)

- Stores input variables used across the project.

### 3. **Providers** (`providers.tf`)

- Configures AWS as the primary provider.

### 4. **EC2 Instance Configuration** (`ec2.tf`)

- Provisions EC2 instances with user data to initialize and configure Apache web server.

### 5. **Load Balancer Configuration** (`lb.tf`)

- Creates an application load balancer to distribute traffic across EC2 instances.
- Configures listeners and target groups.

### 6. **Remote State** (`remote_state.tf`)

- Enables remote state storage and locking in an S3 bucket.
- Ensures consistent and collaborative infrastructure management.

### 7. **User Data Script** (`user_data.sh`)

- Bootstraps the EC2 instances with essential software.
- Installs Apache and sets up a basic HTML page.

```bash
#!/bin/bash
sudo apt-get update
sudo apt-get -y install apache2
echo "<h2>Hello ${instance_id}</h2>"  > /var/www/html/index.html
sudo systemctl start apache2
sudo systemctl enable apache2
```

## How to Use

1. Clone the repository.

   ```bash
   git clone <repository_url>
   ```

2. Initialize Terraform.

   ```bash
   terraform init
   ```

3. Review and adjust variables in `variables.tf` as needed.

4. Plan the infrastructure.

   ```bash
   terraform plan
   ```

5. Apply the configuration.

   ```bash
   terraform apply
   ```

6. Destroy the infrastructure when no longer needed.

   ```bash
   terraform destroy
   ```

## Prerequisites

- Terraform installed (>= v1.0).
- AWS CLI configured with appropriate credentials.
- An AWS account with permissions tLicense

  This project is licensed under the MIT License.o create resources.

##
