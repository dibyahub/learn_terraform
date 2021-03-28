variable server{}
variable certificate-authority-data{}
variable k8s_username{}
variable k8s_password{}
variable public_url{}

provider "helm" {
  kubernetes {
    host                   = var.server
    cluster_ca_certificate = base64decode(var.certificate-authority-data)
    username = var.k8s_username
    password = var.k8s_password
  }
}

resource "helm_release" "example" {
  name       = "etherpad"
  repository = "https://nicholaswilde.github.io/helm-charts/"
  chart      = "etherpad"

  values = [
    file("values.yml")
  ]
}
