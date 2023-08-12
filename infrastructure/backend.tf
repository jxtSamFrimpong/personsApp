terraform {
  backend "gcs" {
    bucket = "persons-portfolio"
    prefix = "state"
  }
}
