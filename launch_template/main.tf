provider "aws" {
  region = var.region
}

resource "aws_launch_template" "aurva-tf" {
  name = "aurva-tf"
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }

  network_interfaces {
    security_groups = var.security_groups
  }

  image_id = var.image_id
  instance_type = var.instance_type

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
        Name = "Aurav-test"
    }  
  }
  user_data = filebase64("${path.module}/userdata.sh")
}
