# Global GCP 
gcp_project = "gl-dsi-ecom-unstable-ia"
gcp_region  = "europe-west1"

# Bucket
bucket-name = "cloud-function-demo-ecom-bucket-dm"
bucket-location  = "europe-west1"

# Function
name        = "cloud-function-helloworld"
description = "Demo ECOM cloud function helloworld"
runtime     = "nodejs10"
available_memory_mb   = 128
entrypoint           = "helloGET"