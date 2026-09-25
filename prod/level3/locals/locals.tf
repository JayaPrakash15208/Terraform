locals {
  project     = "terraform-learning"
  environment = "dev"
  application = "web"
  managed_by  = "terraform"

  name_prefix = "${local.project}-${local.environment}-${local.application}"

  common_tags = {
    Project     = local.project
    Environment = local.environment
    Application = local.application
    ManagedBy   = local.managed_by
  }
}
