terraform {
  required_version = ">= 1.12.0"
  backend "remote" {
    organization = "JayKaruProject" # Must match exactly
  workspaces {
      prefix = "env-" # Dynamic workspace selection
    }
  }
}