resource "aws_imagebuilder_image_pipeline" "my-pipeline" {
  schedule {
    schedule_expression = "cron(0 0 ? * 7 *)" # Every Saturday at midnight
  }
  name                             = "my-pipeline"
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infra-config.arn
  image_recipe_arn                 = aws_imagebuilder_image_recipe.my-image-recipe.arn
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.distribution.arn
}