output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "jenkins_public_ip" {
  description = "Public IP of Jenkins EC2"
  value       = module.ec2_jenkins.public_ip
}

output "sonarqube_public_ip" {
  description = "Public IP of SonarQube EC2"
  value       = module.ec2_sonarqube.public_ip
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = var.create_ecr ? aws_ecr_repository.app[0].repository_url : null
}
