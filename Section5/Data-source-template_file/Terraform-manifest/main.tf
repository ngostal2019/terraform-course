## Uncommenting the below line tags variable will produce an error due to tags being a map(string) which is not supported by data source template_file
data "template_file" "template_file_map_test" {
  template = file("user_data.tpl")
  vars = {
    region        = var.region
    image_id      = var.image_id
    instance_type = var.instance_type
    # tags          = var.tags
  }
}

resource "aws_launch_configuration" "template_file_map_test" {
  name          = "template_file_map_test"
  image_id      = var.image_id
  user_data     = data.template_file.template_file_map_test.rendered
  instance_type = var.instance_type
}

output "templafile_function_test" {
  description = "Test templatefile function"
  value = templatefile("user_data.tpl", {
    "image_id"      = var.image_id
    "instance_type" = var.instance_type
    "region"        = var.region
  })
}