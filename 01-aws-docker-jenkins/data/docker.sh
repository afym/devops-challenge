#!/bin/bash
yum update -y
yum remove java-1.7.0-openjdk -y
yum install java-1.8.0-openjdk -y
yum install git wget -y
yum install -y docker
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
wget https://aws-codedeploy-us-west-2.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
usermod -aG docker
usermod -a -G docker ec2-user
service docker start
service codedeploy-agent start