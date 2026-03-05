#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y docker git jq
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

mkdir -p /opt/jenkins

# Run Jenkins in Docker for a reproducible bootstrap.
docker run -d \
  --name jenkins \
  --restart unless-stopped \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /opt/jenkins:/var/jenkins_home \
  jenkins/jenkins:lts
