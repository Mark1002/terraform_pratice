resource "google_project_iam_binding" "project" {
  for_each = toset(var.iam_roles)
  project = var.project_id
  role    = each.key

  members = [
    "serviceAccount:${google_service_account.sa.email}",
  ]
}

resource "google_service_account" "sa" {
  account_id   = "tf-service"
  display_name = "The service account for terraform example"
}

resource "google_service_account_key" "server-key" {
  service_account_id = google_service_account.sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}
