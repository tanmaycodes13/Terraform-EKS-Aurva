Output:

Terraform plan:

```
tanmay@Tanmays-MacBook-Air launch_template % terraform plan 

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_launch_template.aurva-tf will be created
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

Plan: 1 to add, 0 to change, 0 to destroy.
```
