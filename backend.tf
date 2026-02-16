terraform {
  backend "gcs" {
    bucket = "bkt-tfstate-004"
    prefix = "tf/state"
  }
}
