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

resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "infra"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "5.8.45"
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
  values = [file("${path.module}/grafana-values.yaml")]
}

resource "helm_release" "app_1" {
  name       = "app-1"
  namespace  = "apps"
  chart      = "${path.module}/../apps/app-1/helm/"
}