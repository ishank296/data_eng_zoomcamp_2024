provider "google" {
  project = var.project
  credentials = file(var.credential)
  region = var.region
}

resource "google_storage_bucket" "demo-bucket" {
    name = var.gcs_bucket_name
    storage_class = var.gcs_storage_class
    location = var.location
    force_destroy = true
    lifecycle_rule {
      condition {
        age = 1
      }
      action {
        type="AbortIncompleteMultipartUpload"
      }
    }
}

resource "google_bigquery_dataset" "demo_dataset" {
    dataset_id = "demo_dataset_dezoomcamp_202434554"
    location = var.location
  
}

# docker run --rm -it -v "$(pwd):/apps" hashicorp/terraform -chdir="/apps" plan
# docker run --rm -it -v "$(pwd):/apps" hashicorp/terraform -chdir="/apps" apply
# google_bigquery_dataset.demo_dataset: Creating...
# google_storage_bucket.demo-bucket: Creating...
# google_bigquery_dataset.demo_dataset: Creation complete after 3s [id=projects/ferrous-acronym-412604/datasets/demo_dataset_dezoomcamp_202434554]
# google_storage_bucket.demo-bucket: Creation complete after 4s [id=datalake-bucket-dezoomcamp20246]

# Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
