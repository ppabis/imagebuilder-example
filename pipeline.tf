resource "aws_imagebuilder_image_pipeline" "my-pipeline" {
  schedule {
    schedule_expression = "cron(0 0 ? * 7 *)" # Every Saturday at midnight
  }
  name                             = "my-pipeline"
  infrastructure_configuration_arn = "" // Will be added later
  image_recipe_arn                 = "" // Will be added later
  distribution_configuration_arn   = "" // Will be added later
}