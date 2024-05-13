variable "image_id" {
  type = string
  description = "The AMI ID that we want to pass"
  default = "ami-05b14f60947ef1d2b" # Public AMI Image for eks Managed nodes
}

variable "instance_type" {
  type = string
  description = "The instance type of the node"
  default = "t2.micro"
}

variable "region" {
  description = "Region for creating resource"
  default = "us-west-2"
}

variable "security_groups" {
  type = list(string)
  default = ["sg-0b0519ac6d294865b"]
}
