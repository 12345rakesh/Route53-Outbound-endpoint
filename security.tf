resource "aws_security_group" "dwp-outbound" {
  name   = "dwp-sg"
  vpc_id = var.mainvpc


  # HTTP access from 10.0.0.0/8
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["10.16.0.0/16"]
  }


  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}