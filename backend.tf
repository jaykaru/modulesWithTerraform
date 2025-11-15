terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "JayKaruProject"
    workspaces {
      prefix = "env-" # Workspaces will be env-dev, env-prod, etc.
    }
  }
}