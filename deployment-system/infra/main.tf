resource "kubernetes_namespace" "infra" {
  metadata {
    name = "infra"
  }
}

resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "infra"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "27.15.0"
}

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "infra"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "9.0.0"
  values     = [file("${path.module}/grafana-values.yaml")]
}