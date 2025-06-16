resource "aws_instance" "kube"{
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.kubesg.id]
}

resource "aws_security_group" "kubesg" {
  name        = "kubesg"
  description = "Allowing all traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}