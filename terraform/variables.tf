variable "region" { type = string }

variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }
variable "private_subnet_for_bastion_cidr" { type = string }
variable "private1_subnet_cidr" { type = string }
variable "private2_subnet_cidr" { type = string }

variable "private_subnet_for_bastion_AZ" { type = string }
variable "private1_subnet_AZ" { type = string }
variable "private2_subnet_AZ" { type = string }


variable "cluster_name" { type = string }
variable "project_name" { type = string }
variable "environment_name" { type = string }



# variable "ami" {
#   type        = string
#   description = "AMI of the image"
# }

# variable "instance_type" {
#   type        = string
#   description = "instance_type"
# }

# variable "instance_tags" {
#   type = map(any)
# }

# variable "tags" {
#   type = map(any)
# }
