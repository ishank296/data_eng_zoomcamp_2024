variable "location" {
    description = "project/resource location"
    default = "US"
}

variable "gcs_bucket_name" {
    description = "My Storage Bucket Name"
    default = "demo-bucket-v00001"
}

variable "gcs_storage_class" {
    description = "Google cloud bucket storage class"
    default = "STANDARD"
}

variable "bq_dataset_name" {
    description = "Bigquery dataset Name"
    default = "demo-bq-dataset-v00001"
  
}