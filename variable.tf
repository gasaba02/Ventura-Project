variable "vpc_cidar" {
  description = "Cidar block for Prod_VPC"
  type        = string
  default     = "10.0.0.0/16"

}

variable "pub_availability_zone" {
  description = "AZs for all the subnets"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]

}

# variable "availability_zone1" {
#   type    = string
#   default = "us-east-1a"

# }

# variable "availability_zone2" {
#   type    = string
#   default = "us-east-1b"

# }

variable "pub_subnet_cidar" {
  description = "cidars for the two public subnets"
  type        = list(any)
  default     = ["10.0.1.0/28", "10.0.3.0/28"]

}

variable "priv_subnet_cidar" {
  description = "AZs for the private subnets"
  type        = list(any)
  default = ["10.0.4.0/23", "10.0.10.0/23", "10.0.14.0/23", "10.0.20.0/23",
  "10.0.25.0/27", "10.0.30.0/27"]

}

variable "pub_subnet_names" {
  description = "names for the public subnets"
  type        = list(any)
  default     = ["Ventura-Prod-NAT-ALB-Subnet-1", "Ventura-Prod-ALB-Subnet-2"]

}

variable "priv_sunbet_names" {
  description = "names for the private subnets"
  type        = list(any)
  default = ["Ventura-Prod-Web-Subnet-1",
    "Ventura-Prod-Web-Subnet-2", "Ventura-Prod-App-Subnet-1", "Ventura-Prod-App-Subnet-2",
  "Ventura-Prod-DB-Subnet-1", "Ventura-Prod-DB-Subnet-2"]

}

