resource "google_storage_bucket" "my_bucket" {
  name     = "bkt-demo-4742"
  location = "US-CENTRAL1"
  project  = "majestic-post-487306-p4"

  force_destroy = true

  public_access_prevention = "enforced"
  uniform_bucket_level_access = true
}
