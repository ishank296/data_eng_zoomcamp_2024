variable "credential" {
    description = "path to google credential file"
    default = "/apps/keys/my_cred.json"
}

variable "project" {
    description = "Project"
    default = "ferrous-acronym-412604"
}

variable "region" {
    description = "Region"
    default = "us-central1"
}

variable "location" {
  description = "project location"
  default = "US"
}

variable "gcs_bucket_name" {
    description = "Storage bucket name"
    default = "datalake-bucket-dezoomcamp20246"
}

variable "gcs_storage_class" {
    description = "bucket storage class"
    default = "STANDARD"
  
}
