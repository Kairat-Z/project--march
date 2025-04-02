provider "google" {
  project     = "deep-thought-452402-v6a"  
  region      = "us-central1"              
}

provider "kubernetes" {
  host                   = "https://34.31.120.2" 
  cluster_ca_certificate = file("ca.crt")
  token                  = data.google_client_config.default.access_token
}

resource "helm_release" "web" {
  name       = "web"
  chart      = "../helm/helm-web"  # Path to your Web chart directory
  version    = "0.1.0"
  namespace  = "default"
  # timeout    = 1200  # Timeout increased to 1200 seconds (20 minutes)

}

resource "helm_release" "api" {
  name       = "api"
  chart      = "../helm/helm-api"  # Path to your API chart directory
  version    = "0.1.0"
  namespace  = "default"
  # timeout    = 1200  # Timeout increased to 1200 seconds (20 minutes)

}

resource "helm_release" "mysql" {
  name       = "mysql"
  chart      = "../helm/helm-mysql"  # Path to your MySQL chart directory
  version    = "0.1.0"
  namespace  = "default"
}