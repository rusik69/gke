provider "google" {
  credentials = "${file("~/gcp-creds.json")}"
  project     = "decent-tracer-255319"
  region      = "europe-west1"
}
resource "google_compute_network" "katsanddogs" {
  name                    = "katsanddogs"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "katsanddogs-prod" {
  name          = "katsanddogs-prod"
  ip_cidr_range = "10.1.0.0/16"
  secondary_ip_range {
    range_name    = "katsanddogs-prod-pods"
    ip_cidr_range = "10.2.0.0/16"
  }
  secondary_ip_range {
    range_name    = "katsanddogs-prod-services"
    ip_cidr_range = "10.3.0.0/16"
  }
  network = google_compute_network.katsanddogs.self_link
  region  = "europe-west1"
}
