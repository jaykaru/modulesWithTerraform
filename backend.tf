terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "JayKaruProject" # Must match exactly
  workspaces {
      name = "" # Placeholder, will be overridden by TF_WORKSPACE
    }
  }
}