provider "aws" {
  region = "us-east-1" # Change this to your desired region
}

# Input variables
variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the instance will be launched"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for SSH access"
  type        = string
}

variable "vpc_security_group_ids" {
    
}

variable "ebs_volume_size" {
  description = "The size of the additional EBS volume in GB"
  type        = number
}

variable "ebs_volume_type" {
  description = "The type of the EBS volume (e.g., gp2, io1, etc.)"
  type        = string
  default     = "gp2"
}

variable "ebs_delete_on_termination" {
  description = "Whether to delete the EBS volume on instance termination"
  type        = bool
  default     = true
}


# EC2 instance resource
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name


  # Root EBS volume (can be omitted if default settings are fine)
  root_block_device {
    volume_size = 10       # Default root volume size in GB (can be adjusted)
    volume_type = "gp2"    # Default root volume type
  }


  tags = {
    Name = "terraform_instance"
  }
}

# Output the public IP address of the instance
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}
