provider "aws" {
  region = "us-west-2"
}

module "launch_template" {
    source = "../launch_template"
}

module "cluster_iam_role" {
    source = "../iam/cluster"
}

module "node_iam_role" {
    source = "../iam/node_group"
}

resource "aws_eks_cluster" "aurva_k8s" {
  name = "aurva_k8s"
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  role_arn = module.cluster_iam_role.aws_iam_role
}

resource "aws_eks_node_group" "k8s_node_group" {
  cluster_name = aws_eks_cluster.aurva_k8s.name
  node_group_name = "aurva-node-group"
  node_role_arn = module.node_iam_role.node_role_arn
  subnet_ids = var.subnet_ids

  scaling_config {
    min_size = 1
    max_size = 4
    desired_size = 1
  }

  launch_template {
    id = module.launch_template.launch_template_id
    version = module.launch_template.launch_template__latest_version
  }
}
