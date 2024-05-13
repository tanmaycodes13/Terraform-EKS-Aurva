Terraform Plan output:

```

tanmay@Tanmays-MacBook-Air eks % terraform plan               
module.cluster_iam_role.data.aws_iam_policy_document.assume_role: Reading...
module.cluster_iam_role.data.aws_iam_policy_document.assume_role: Read complete after 0s [id=3552664922]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eks_cluster.aurva_k8s will be created
  + resource "aws_eks_cluster" "aurva_k8s" {
      + arn                   = (known after apply)
      + certificate_authority = (known after apply)
      + cluster_id            = (known after apply)
      + created_at            = (known after apply)
      + endpoint              = (known after apply)
      + id                    = (known after apply)
      + identity              = (known after apply)
      + name                  = "aurva_k8s"
      + platform_version      = (known after apply)
      + role_arn              = (known after apply)
      + status                = (known after apply)
      + tags_all              = (known after apply)
      + version               = (known after apply)

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = false
          + endpoint_public_access    = true
          + public_access_cidrs       = (known after apply)
          + subnet_ids                = [
              + "subnet-0479f628572549307",
              + "subnet-056f7717dea5cab71",
            ]
          + vpc_id                    = (known after apply)
        }
    }

  # aws_eks_node_group.k8s_node_group will be created
  + resource "aws_eks_node_group" "k8s_node_group" {
      + ami_type               = (known after apply)
      + arn                    = (known after apply)
      + capacity_type          = (known after apply)
      + cluster_name           = "aurva_k8s"
      + disk_size              = (known after apply)
      + id                     = (known after apply)
      + instance_types         = (known after apply)
      + node_group_name        = "aurva-node-group"
      + node_group_name_prefix = (known after apply)
      + node_role_arn          = (known after apply)
      + release_version        = (known after apply)
      + resources              = (known after apply)
      + status                 = (known after apply)
      + subnet_ids             = [
          + "subnet-0479f628572549307",
          + "subnet-056f7717dea5cab71",
        ]
      + tags_all               = (known after apply)
      + version                = (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = (known after apply)
        }

      + scaling_config {
          + desired_size = 1
          + max_size     = 4
          + min_size     = 1
        }
    }

  # module.cluster_iam_role.aws_iam_role.cluster_role will be created
  + resource "aws_iam_role" "cluster_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "cluster_role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)
    }

  # module.cluster_iam_role.aws_iam_role_policy_attachment.K8s-AmazonEKSClusterPolicy will be created
  + resource "aws_iam_role_policy_attachment" "K8s-AmazonEKSClusterPolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = "cluster_role"
    }

  # module.cluster_iam_role.aws_iam_role_policy_attachment.K8s-AmazonEKSVPCResourceController will be created
  + resource "aws_iam_role_policy_attachment" "K8s-AmazonEKSVPCResourceController" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
      + role       = "cluster_role"
    }

  # module.launch_template.aws_launch_template.aurva-tf will be created
  + resource "aws_launch_template" "aurva-tf" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + id                     = (known after apply)
      + image_id               = "ami-0e699f19dfee494b4"
      + instance_type          = "t2.micro"
      + latest_version         = (known after apply)
      + name                   = "aurva-tf"
      + name_prefix            = (known after apply)
      + tags_all               = (known after apply)
      + vpc_security_group_ids = [
          + "sg-09467f0a4e4bcb540",
        ]

      + block_device_mappings {
          + device_name = "/dev/xvda"

          + ebs {
              + iops        = (known after apply)
              + throughput  = (known after apply)
              + volume_size = 20
              + volume_type = "gp2"
            }
        }

      + monitoring {
          + enabled = true
        }

      + placement {
          + availability_zone = "us-west-2a"
        }

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Name" = "Aurav-test"
            }
        }
    }

  # module.node_iam_role.aws_iam_role.node_role will be created
  + resource "aws_iam_role" "node_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "aurva-node-group"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)
    }

  # module.node_iam_role.aws_iam_role_policy_attachment.nodeRole-AmazonEC2ContainerRegistryReadOnly will be created
  + resource "aws_iam_role_policy_attachment" "nodeRole-AmazonEC2ContainerRegistryReadOnly" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      + role       = "aurva-node-group"
    }

  # module.node_iam_role.aws_iam_role_policy_attachment.nodeRole-AmazonEKSWorkerNodePolicy will be created
  + resource "aws_iam_role_policy_attachment" "nodeRole-AmazonEKSWorkerNodePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      + role       = "aurva-node-group"
    }

  # module.node_iam_role.aws_iam_role_policy_attachment.nodeRole-AmazonEKS_CNI_Policy will be created
  + resource "aws_iam_role_policy_attachment" "nodeRole-AmazonEKS_CNI_Policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      + role       = "aurva-node-group"
    }

Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + endpoint = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly
these actions if you run "terraform apply" now.

```
