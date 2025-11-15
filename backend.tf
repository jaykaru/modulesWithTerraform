terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "JayKaruProject" # Must match exactly
    workspaces {
      prefix = "env-"
    }
  }
}