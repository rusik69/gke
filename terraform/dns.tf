resource "google_dns_managed_zone" "rusik" {
  name     = "rusik"
  dns_name = "rusik.dev."
}

resource "google_dns_record_set" "rusik" {
  name         = google_dns_managed_zone.rusik.dns_name
  managed_zone = google_dns_managed_zone.rusik.name
  type         = "A"
  ttl          = 300

  rrdatas = ["116.203.222.149"]
}

resource "google_dns_record_set" "aws" {
  name         = "aws.rusik.dev."
  managed_zone = google_dns_managed_zone.rusik.name
  type         = "A"
  ttl          = 300

  rrdatas = ["18.184.158.112"]
}

resource "google_dns_record_set" "dashboard-linkerd" {
  name         = "linkerd.rusik.dev."
  managed_zone = google_dns_managed_zone.rusik.name
  type         = "A"
  ttl          = 300

  rrdatas = ["35.241.246.125"]
}