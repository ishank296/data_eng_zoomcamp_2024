provider "google" {
  project     = "ferrous-acronym-412604"
  region      = "us-central1"
  
}

resource "google_storage_bucket" "demo_bucket" {
    name = "terraform-demo-32655-bucket001"
    location = "US"
    force_destroy = true

    lifecycle_rule {
      condition {
        age = 1
      }
      action {
        type = "AbortIncompleteMultipartUpload"
      }

    }
}

resource "google_bigquery_dataset" "demo_bq_dataset" {
    dataset_id = "demo_bigquery_436445"
    location = "US"
  
}

#docker run --rm -it -v "$(pwd):/apps" -e GOOGLE_APPLICATION_CREDENTIALS="/apps/keys/my_cred.json" hashicorp/terraform -chdir=/apps init