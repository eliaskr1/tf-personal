provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
}

resource "google_firestore_database" "default" {
  name       = "(default)"
  project    = var.project_id
  location_id = var.region
  type       = var.type
  depends_on = [google_project_service.firestore]
}
