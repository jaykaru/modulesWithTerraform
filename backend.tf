terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "JayKaruProject" # Must match exactly
  workspaces {
      prefix = "" # Placeholder, will be overridden by TF_WORKSPACE
    }
  }
}