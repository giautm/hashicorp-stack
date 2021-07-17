# Issue where non-existent namespace does not result in
# failure behavior.
# https://github.com/terraform-providers/terraform-provider-helm/issues/427

resource "kubernetes_namespace" "secrets" {
  count = var.enable_consul_and_vault ? 1 : 0
  metadata {
    annotations = {
      name = var.namespace
    }

    labels = {
      purpose = "consul"
    }

    name = var.namespace
  }

  timeouts {
    delete = "15m0s"
  }
}