# GCP 
variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

# Google Storage Bucket
variable "bucket-name" {
  type        = string
  description = "Name of the Google Storage Bucket"
}

variable "bucket-location" {
  type        = string
  description = "Location bucket "
}

# Google Cloud Function 
variable "name" {
  type        = string
  description = ""
}

variable "description" {
  type        = string
  description = ""
}

variable "runtime" {
  type        = string
  description = ""
}

variable "entrypoint" {
  type        = string
  description = ""
}

variable "available_memory_mb" {
  type        = number
  description = ""
}
