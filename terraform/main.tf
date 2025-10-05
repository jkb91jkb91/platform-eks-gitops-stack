
# terraform destroy \
#  -target=module.vpc \
#  -target=module.iam \
#  -target=module.sg \
#  -target=module.lb \
#  -target=module.ecs \
#  -target=module.vpcEndpoints


module "vpc" {
  region                          = var.region
  private_subnet_for_bastion_AZ   = var.private_subnet_for_bastion_AZ
  private1_subnet_AZ              = var.private1_subnet_AZ
  private2_subnet_AZ              = var.private2_subnet_AZ
  private_subnet_for_bastion_cidr = var.private_subnet_for_bastion_cidr
  private1_subnet_cidr            = var.private1_subnet_cidr
  private2_subnet_cidr            = var.private2_subnet_cidr
  vpc_name                        = var.vpc_name
  cluster_name                    = var.cluster_name
  vpc_cidr                        = var.vpc_cidr
  project_name                    = var.project_name
  environment_name                = var.environment_name
  source                          = "./modules/vpc"
}

module "vpc_endpoints" {
  region                             = var.region
  project_name                       = var.project_name
  environment_name                   = var.environment_name
  cluster_name                       = var.cluster_name
  vpc_id                             = module.vpc.vpc_id
  vpc_name                           = var.vpc_name
  private_subnet_for_bastion_host_id = module.vpc.private_subnet_for_bastion_host_id
  source                             = "./modules/vpc_endpoints"
}

# IAM
# module "iam" {
#   source = "./modules/iam"
# }

# SG
# module "sg" {
#   source = "./modules/sg"
#   vpc_id = module.vpc.vpc_id
# }

# EKS
# module "eks" {
#   source = "./modules/eks"
#   vpc_id = module.vpc.vpc_id
# }



# # ECR
# module "ecr" {
#   source                 = "./modules/ecr"
#   fargate_extra_role_arn = module.iam.fargate_extra_role_arn
# }

# EC2
# module "bastion_host" {
#   source        = "./modules/ec2"
#   vpc_id        = module.vpc.vpc_id
#   subnet_id     = module.vpc.public_ec2_subnet_id
#   ami           = "ami-04b4f1a9cf54c11d0"
#   instance_type = "t2.micro"
# }





