provider "google-beta" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "firebase" {
  project = var.project_id
  service = "firebase.googleapis.com"
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project = var.project_id
  depends_on = [google_project_service.firebase]
}
