provider "google" {
  project = "gl-dsi-ecom-unstable-ia"
  region  = "europe-west1"
  version = "~> 3.18"
}

resource "google_storage_bucket" "bucket" {
  name = "cloud-function-demo-ecom-bucket-dm" # This bucket name must be unique
  location  = "europe-west1"
}

data "archive_file" "src" {
  type        = "zip"
  source_dir  = "${path.module}/../src"
  output_path = "${path.module}/../generated/src.zip"
}

resource "google_storage_bucket_object" "archive" {
  name   = "${data.archive_file.src.output_md5}.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${path.module}/../generated/src.zip"
}


resource "google_cloudfunctions_function" "function" {
  name        = "cloud-function-helloworld"
  description = "Demo ECOM cloud function helloworld"
  runtime     = "nodejs10"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "helloGET"
}
# IAM entry for all users to invoke the function
 resource "google_cloudfunctions_function_iam_member" "invoker" {
   project        = google_cloudfunctions_function.function.project
   region         = google_cloudfunctions_function.function.region
   cloud_function = google_cloudfunctions_function.function.name
   role   = "roles/cloudfunctions.invoker"
   member = "allUsers"
 }



