resource "aws_security_group" "taskflow_sg" {
  name        = "${var.project_name}-sg"
  description = "Security Group for TaskFlow"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TaskFlow Application"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

resource "aws_instance" "taskflow_server" {
  ami                    = "ami-0aba19e56f3eaec05"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.taskflow_sg.id]

  tags = {
    Name    = var.project_name
    Project = var.project_name
  }
}
