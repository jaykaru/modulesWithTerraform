terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "JayKaruProject" # Must match exactly
  workspaces {
      name = "dev" # Placeholder, will be overridden by TF_WORKSPACE
    }
  }
}