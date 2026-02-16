resource "google_storage_bucket" "my-bucket" {
  name          = "bkt-demo-000"
  location      = "us-central1"
  project = "My Project 4099"
  force_destory = true
  public_access_prevention = "enforced" 
}
