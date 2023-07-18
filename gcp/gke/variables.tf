provider "google" {
  project = "sharp-voyage-345407"
  region  = "us-east1"
}

terraform {
  backend "gcs" {
    bucket = "timiddev-tfstate"
    prefix = "terraform-gke"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51.0, < 4.65.0"
    }
  }
}
