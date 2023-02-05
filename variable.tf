variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-2"
}

# variable "subnet_id" {
#   type        = string
#   description = "Attach security groups to alb"
#   default     = "subnet-0ed5ddeb80ca60485"
# }

# variable "subnet_id" {
#   type        = string
#   description = "Attach security groups to alb"
#   default     = "sg-05edd728364259080"
# }

variable "security_group_id" {
  type        = list(any)
  description = "Attach security groups to alb"
  default     = ["sg-05edd728364259080"]
}

variable "mainvpc" {
  default = "vpc-06e0af349d3541c7a"
}