resource "google_service_account" "kubernetes" {
  account_id = var.service_account
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "kubernetes" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam
# resource "google_service_account_iam_member" "kubernetes" {
#   service_account_id = google_service_account.kubernetes.id
#   role               = "roles/iam.workloadIdentityUser"
#   member             = "serviceAccount:${var.project_id}.svc.id.goog[staging/kubernetes]"
# }




