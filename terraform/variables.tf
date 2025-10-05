variable "vpc_cidr" {
  type        = string
  description = "Cidr for vpc"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Cidr for public subnet"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment_name" {
  type        = string
  description = "Environment name"
}





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
