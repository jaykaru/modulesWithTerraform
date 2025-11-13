terraform {
  backend "remote" {
    organization = "JayKaruProject"

    workspaces {
      prefix = "env-" # Workspaces will be env-dev, env-prod, etc.
    }
  }
}