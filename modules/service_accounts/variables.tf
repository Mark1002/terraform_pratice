variable "iam_roles" {
  type = list(string)
  default = [
    "roles/bigquery.dataEditor",
    "roles/bigquery.dataViewer",
    "roles/bigquery.jobUser",
    "roles/datastore.user",
    "roles/firebaseauth.admin",
    "roles/secretmanager.secretAccessor",
    "roles/storage.admin",
    "roles/pubsub.publisher"
  ]
}

variable "project_id" {
  type        = string
}
