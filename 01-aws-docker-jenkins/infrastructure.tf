resource "aws_instance" "ci_server" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${path.module}/data/docker-jenkins.sh")}"
  vpc_security_group_ids = ["${aws_security_group.ci_server_secutiry.id}"]

  tags {
    Name = "${var.ci_tag_name}"
  }
}

resource "aws_security_group" "ci_server_secutiry" {
  name        = "${var.ci_tag_name}_secutiry"
  # for jenkins ci server
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # just for test purposes !! (insecure)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.ci_tag_name}_security"
  }
}

resource "aws_instance" "app_server" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${path.module}/data/docker.sh")}"
  vpc_security_group_ids = ["${aws_security_group.ci_server_secutiry.id}"]

  tags {
    Name = "${var.app_tag_name}"
  }
}

resource "aws_security_group" "app_server_secutiry" {
  name        = "${var.app_tag_name}_secutiry"
  # for application server
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # just for test purposes !! (insecure)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.app_tag_name}_security"
  }
}