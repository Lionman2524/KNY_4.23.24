terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "firm-retina-416800"
region = "us-central1"
zone = "us-central1-a"
credentials = "firm-retina-416800-afc2424ec424.json"
}

resource "google_storage_bucket" "static-site" {
  name          = "firm-retina-416800"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}



