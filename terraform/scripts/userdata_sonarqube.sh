#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

mkdir -p /opt/sonarqube

# Run SonarQube in Docker for simpler provisioning.
docker run -d \
  --name sonarqube \
  --restart unless-stopped \
  -p 9000:9000 \
  -v /opt/sonarqube:/opt/sonarqube/data \
  sonarqube:lts-community
