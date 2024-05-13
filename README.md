EKS-Terraform

Terraform state management via s3 as backend -> Defined in terraform.tf

Modules -> iam , launch_template 

Both the modules in eks folder

```
cd eks
terraform init --upgrade=True
terraform plan
terraform apply
```

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
          + "subnet-0618624ec2c886e90",
          + "subnet-0ba8fddda5066ad74",
        ]
      + tags                   = {
          + "kubernetes.io/cluster/aurva_k8s" = "owned"
        }
      + tags_all               = {
          + "kubernetes.io/cluster/aurva_k8s" = "owned"
        }
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
      + arn             = (known after apply)
      + default_version = (known after apply)
      + id              = (known after apply)
      + image_id        = "ami-05b14f60947ef1d2b"
      + instance_type   = "t2.micro"
      + latest_version  = (known after apply)
      + name            = "aurva-tf"
      + name_prefix     = (known after apply)
      + tags_all        = (known after apply)
      + user_data       = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVVJDVkVORFFXVXlaMEYzU1VKQlowbEpaVFF2T0dWWU1FNWxObFYzUkZGWlNrdHZXa2xvZG1OT1FWRkZURUpSUVhkR1ZFVlVUVUpGUjBFeFZVVUtRWGhOUzJFelZtbGFXRXAxV2xoU2JHTjZRV1ZHZHpCNVRrUkJNVTFVVFhoT2FrazBUVlJhWVVaM01IcE9SRUV4VFZSRmVFNXFUWHBOVkZwaFRVSlZlQXBGZWtGU1FtZE9Wa0pCVFZSRGJYUXhXVzFXZVdKdFZqQmFXRTEzWjJkRmFVMUJNRWREVTNGSFUwbGlNMFJSUlVKQlVWVkJRVFJKUWtSM1FYZG5aMFZMQ2tGdlNVSkJVVVJEY1dOQk1HVlhUVWx3YkZkRmQyVk5NVGxFTDI0NU9EbHBSMjF5TTBoSE1VdFBjRWRCTldKdVJ6WkNPSGRDVEdKWFRIWXJUV2xZWW0wS1ZWRkphblYwY3pjMVdIWXpibFIzTWxOalkwVk9NREp6VjFsVGNYTk1hVkowV1hGeUsydDZZeTl2TVhwc2N6WkVSbU42YW1GUEwwWTBZVTFOT1Robk5BbzFOREJITVhGUEx6WndibTFKYjNsMVZFVlRVV3gxVjFseFVsTmFiWGh0Y0ZKbFdqSnVRMVZvVDBKR1pXWkpZVms0Y1cxTlNUQlhRMjVtWVZObkswdHdDak5aVHpWMlJrSkJTRlUwUlVsTFZGRTVVR3QwWjJJNFIxVk5RekZWVm1oS1VISmliV1owUlROV1YzaEZibnAyVDJsTVZXVlZWR1pvTkdOTk5TOTRkREFLYkdwcVYzWmFVRlExWWt0RFoybERNMjlxT1RWNU1tdFdRM001ZUZaaWIyeHJRM3BsYzNKSlZXWlFlREJNY1VSWWJVNVNTRmRSYVdGbVoyVkJjbFJ6VFFwT2JqbE1TVTFoY1VaUldFbFNjRTByVml0T2RITlBWVU5ITkdGNFFXZE5Ra0ZCUjJwWFZFSllUVUUwUjBFeFZXUkVkMFZDTDNkUlJVRjNTVU53UkVGUUNrSm5UbFpJVWsxQ1FXWTRSVUpVUVVSQlVVZ3ZUVUl3UjBFeFZXUkVaMUZYUWtKVVEzbG5ha2M0ZFRCNVRIWm9RM0pxZEhOM1ZYRjNSRmxoYldacVFWWUtRbWRPVmtoU1JVVkVha0ZOWjJkd2NtUlhTbXhqYlRWc1pFZFdlazFCTUVkRFUzRkhVMGxpTTBSUlJVSkRkMVZCUVRSSlFrRlJRbVJKUjJ0a01VZ3hWZ3BZYTBwVWN6TjZRV2g1VFRGMGFsbzVkVVl2TVhnMldVdEVlRkpKZHpKbGNqSjZVa0Z2YjNobFJtaElWWFZSVWpCTFRtUk1lRzV3VUhka1pERnpWbkl5Q2xFNFptOVdkVFJvYlVVeWNqVlZaMmhUZW5RNVNXUkRTekZ4TmxSWVJUSnhRakZWWVdZMlJrNTFNSGhtWW1KMWFIaExTbmhKVEZnMFpVaHNaV2hUVldzS1VUTkxkaXM0WmpsTUszQTVlV3hKWTFSV1EwbHhZek5ET0UwdkszaGlkVU4zTTBNM1dGUkNWMjFzTXpaNGFrNXhNSEJHVTAxVGJXWXpPVkZMVEZOeVdRcEVjakY2VFM5Wk0wbHNjMDFVU1RKSWRVcHNWMDlQZG1nMWF6Vndiak5pTDBaWWVtWklRMjB5T0M5Q1IycEdTMUYyV1hwTmNHZzFPSE5yUTBWaU1EZG5DalY2TnpWa1pVeHhOa2RZV1VKM2VqWmtVa3MxT0VjMVEwZFhWRmR1VG5OM2VrWm5SWFZwYkRGeVZqTkZiMHRYYVVjd1NYRjJXa0UxWVN0WlpuWjJNVmdLTm05U05VUm1VbVZvZFVOdUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSwpBUElfU0VSVkVSX1VSTD1odHRwczovLzU0RjJCRDU1OEJBMjQ5QzA2QzI0M0NDNDk4ODBENUNELnlsNC51cy13ZXN0LTIuZWtzLmFtYXpvbmF3cy5jb20KSzhTX0NMVVNURVJfRE5TX0lQPTE3Mi4yMC4wLjEwCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCBhdXJ2YV9rOHMgLS1rdWJlbGV0LWV4dHJhLWFyZ3MgJy0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wNWIxNGY2MDk0N2VmMWQyYixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1hdXJ2YS1ub2RlLWdyb3VwIC0tbWF4LXBvZHM9NCcgLS1iNjQtY2x1c3Rlci1jYSAkQjY0X0NMVVNURVJfQ0EgLS1hcGlzZXJ2ZXItZW5kcG9pbnQgJEFQSV9TRVJWRVJfVVJMIC0tZG5zLWNsdXN0ZXItaXAgJEs4U19DTFVTVEVSX0ROU19JUCAtLXVzZS1tYXgtcG9kcyBmYWxzZQoKLS0vLy0tCg=="

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

      + network_interfaces {
          + security_groups = [
              + "sg-0b0519ac6d294865b",
            ]
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
  + endpoint = "https://54F2BD558BA249C06C243CC49880D5CD.yl4.us-west-2.eks.amazonaws.com"

──────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```
