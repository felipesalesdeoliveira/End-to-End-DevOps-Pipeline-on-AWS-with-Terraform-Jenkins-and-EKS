data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"
  azs         = slice(data.aws_availability_zones.available.names, 0, var.az_count)

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

module "vpc" {
  source = "./vpc"

  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  azs                  = local.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  cluster_name         = var.cluster_name
  tags                 = local.common_tags
}

module "eks" {
  source = "./eks"

  cluster_name                 = var.cluster_name
  kubernetes_version           = var.kubernetes_version
  vpc_id                       = module.vpc.vpc_id
  private_subnet_ids           = module.vpc.private_subnet_ids
  endpoint_public_access_cidrs = var.endpoint_public_access_cidrs
  node_group_name              = var.node_group_name
  node_instance_types          = var.node_instance_types
  node_desired_size            = var.node_desired_size
  node_min_size                = var.node_min_size
  node_max_size                = var.node_max_size
  tags                         = local.common_tags
}

module "ec2_jenkins" {
  source = "./ec2-jenkins"

  name_prefix       = local.name_prefix
  subnet_id         = module.vpc.public_subnet_ids[0]
  vpc_id            = module.vpc.vpc_id
  instance_type     = var.jenkins_instance_type
  key_name          = var.key_name
  ssh_ingress_cidr  = var.ssh_ingress_cidr
  app_ingress_cidr  = var.jenkins_allowed_cidr
  user_data_path    = "${path.module}/scripts/userdata_jenkins.sh"
  additional_policy = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
  tags              = local.common_tags
}

module "ec2_sonarqube" {
  source = "./ec2-sonarqube"

  name_prefix      = local.name_prefix
  subnet_id        = module.vpc.public_subnet_ids[length(module.vpc.public_subnet_ids) > 1 ? 1 : 0]
  vpc_id           = module.vpc.vpc_id
  instance_type    = var.sonarqube_instance_type
  key_name         = var.key_name
  ssh_ingress_cidr = var.ssh_ingress_cidr
  app_ingress_cidr = var.sonarqube_allowed_cidr
  user_data_path   = "${path.module}/scripts/userdata_sonarqube.sh"
  tags             = local.common_tags
}

resource "aws_ecr_repository" "app" {
  count = var.create_ecr ? 1 : 0

  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = local.common_tags
}
