resource "aws_imagebuilder_image_recipe" "my-image-recipe" {
  component { component_arn = aws_imagebuilder_component.docker-component.arn }
  component { 
    component_arn = aws_imagebuilder_component.nginx-component.arn
    parameter {
      name  = "port"
      value = "9000"
    }

    parameter {
      name = "proxy_or_cgi"
      value = "cgi"
    }
  }
  name         = "my-image-recipe"
  parent_image = "arn:aws:imagebuilder:eu-central-1:aws:image/amazon-linux-2023-arm64/2023.x.x"
  version      = "1.0.0"
  description  = <<-EOF
  This is a recipe that takes latest Amazon Linux 2023 and installs latest Docker, Nginx and configures it.
  EOF
}