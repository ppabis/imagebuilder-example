data "aws_vpc" "default" { default = true }

resource "aws_security_group" "imagebuilder" {
  name   = "imagebuilder"
  vpc_id = data.aws_vpc.default.id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_imagebuilder_infrastructure_configuration" "infra-config" {
  instance_types                = ["t4g.small", "t4g.medium"]
  name                          = "my-pipeline-infra"
  security_group_ids            = [aws_security_group.imagebuilder.id]
  terminate_instance_on_failure = true
  instance_profile_name         = aws_iam_instance_profile.imagebuilder.name
}