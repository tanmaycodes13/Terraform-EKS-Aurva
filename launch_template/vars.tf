variable "image_id" {
  type = string
  description = "The AMI ID that we want to pass"
  default = "ami-0e699f19dfee494b4" # Public AMI Image for eks Managed nodes
}

variable "instance_type" {
  type = string
  description = "The instance type of the node"
  default = "t2.micro"
}

variable "vpc_security_group_ids" {
  type = list
  description = "List of VPC groups"
  default = ["sg-09d5995558dadc6b9"]
}

variable "region" {
  description = "Region for creating resource"
  default = "us-west-2"
}
