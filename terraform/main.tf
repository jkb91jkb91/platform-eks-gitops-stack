
# terraform destroy \
#  -target=module.vpc \
#  -target=module.iam \
#  -target=module.sg \
#  -target=module.lb \
#  -target=module.ecs \
#  -target=module.vpcEndpoints


module "vpc" {
  source = "./modules/vpc"
}

# IAM
module "iam" {
  source = "./modules/iam"
}

# SG
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

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





