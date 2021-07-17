resource "helm_release" "consul" {
  count     = var.enable_consul_and_vault ? 1 : 0
  name      = "${var.release_name}-consul"
  namespace = var.namespace

  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = "0.32.1"

  depends_on = [
    kubernetes_namespace.secrets
  ]

  values = [
    "${file("${path.module}/helm-values/consul.yaml")}"
  ]

  set {
    name  = "server.bootstrapExpect"
    value = var.replicas
  }
  set {
    name  = "server.replicas"
    value = var.replicas
  }
}

resource "helm_release" "vault" {
  count     = var.enable_consul_and_vault ? 1 : 0
  name      = "${var.release_name}-vault"
  namespace = var.namespace

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.13.0"

  values = [
    "${file("${path.module}/helm-values/vault.yaml")}"
  ]

  set {
    name  = "server.ha.enabled"
    value = "true"
  }
}