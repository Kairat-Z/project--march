resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-subnet"
  network       = google_compute_network.gke_vpc.id
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"  
}

