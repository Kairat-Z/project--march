resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  deletion_protection = false

  location = "us-central1-a" 

  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
