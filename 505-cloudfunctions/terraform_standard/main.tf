resource "google_storage_bucket" "bucket" {
  name = var.bucket-name
  location  = var.bucket-location
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
  name        = var.name
  description = var.description
  runtime     = var.runtime
  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = var.entrypoint
}

# IAM entry for all users to invoke the function
 resource "google_cloudfunctions_function_iam_member" "invoker" {
   project        = google_cloudfunctions_function.function.project
   region         = google_cloudfunctions_function.function.region
   cloud_function = google_cloudfunctions_function.function.name
   role   = "roles/cloudfunctions.invoker"
   member = "allUsers"
 }
