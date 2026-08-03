variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "taskflow-devops"
}
