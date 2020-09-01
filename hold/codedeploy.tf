resource "aws_codedeploy_app" "rearc-quest-terraform-app" {
  compute_platform = "Server"
  name             = "rearc-quest-terraform-app"
}