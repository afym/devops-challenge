#!/bin/bash
yum update -y
yum remove java-1.7.0-openjdk -y
yum install java-1.8.0-openjdk -y
yum install git -y
yum install -y docker
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
usermod -aG docker jenkins
usermod -a -G docker ec2-user
service docker start
service jenkins start