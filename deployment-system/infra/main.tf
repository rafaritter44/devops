resource "kubernetes_namespace" "infra" {
  metadata {
    name = "infra"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "infra"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "5.8.45"

  # values = [file("${path.module}/jenkins-values.yaml")]
}
