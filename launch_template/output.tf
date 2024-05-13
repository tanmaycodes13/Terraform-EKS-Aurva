output "launch_template_id" {
    value = aws_launch_template.aurva-tf.id
}

output "launch_template_version" {
    value = aws_launch_template.aurva-tf.default_version
}

output "launch_template__latest_version" {
    value = aws_launch_template.aurva-tf.latest_version
}
