terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

variable "cred" {
  description = "google auth credential"
}

provider "google" {
  project =  "ferrous-acronym-412604"
  region="us-central1"
  credentials = file(var.cred)
}

resource "google_storage_bucket" "data-lake-bucket" {
  name = "dezoomcamp-dataset-20244354"
  location = "US"

  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "ny_taxi_dataset" {
  dataset_id = "ny-taxi-dezoomcamp-2024334"
  project = "ferrous-acronym-412604"
  location = "US"
}

# docker run --rm -it -v "$(pwd):/apps" hashicorp/terraform -chdir="/apps" plan -var="cred=/apps/keys/my_cred.json"

