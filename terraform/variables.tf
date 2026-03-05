variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used as prefix"
  type        = string
  default     = "devops-e2e"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of AZs to use"
  type        = number
  default     = 2
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs for EKS nodes"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Create only one NAT gateway"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "devops-eks"
}

variable "kubernetes_version" {
  description = "EKS kubernetes version"
  type        = string
  default     = "1.30"
}

variable "endpoint_public_access_cidrs" {
  description = "CIDRs allowed to access EKS public endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_group_name" {
  description = "EKS managed node group name"
  type        = string
  default     = "devops-ng"
}

variable "node_instance_types" {
  description = "Instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Desired node count"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum node count"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum node count"
  type        = number
  default     = 3
}

variable "aws_auth_admin_role_arn" {
  description = "Optional IAM role ARN to grant cluster-admin via aws-auth"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Optional EC2 key pair name"
  type        = string
  default     = null
}

variable "ssh_ingress_cidr" {
  description = "CIDR allowed to SSH into EC2 instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "jenkins_instance_type" {
  description = "EC2 type for Jenkins"
  type        = string
  default     = "t3.large"
}

variable "sonarqube_instance_type" {
  description = "EC2 type for SonarQube"
  type        = string
  default     = "t3.large"
}

variable "jenkins_allowed_cidr" {
  description = "CIDR allowed to reach Jenkins UI"
  type        = string
  default     = "0.0.0.0/0"
}

variable "sonarqube_allowed_cidr" {
  description = "CIDR allowed to reach SonarQube UI"
  type        = string
  default     = "0.0.0.0/0"
}

variable "create_ecr" {
  description = "Create ECR repository for pipeline images"
  type        = bool
  default     = true
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "sample-application"
}
