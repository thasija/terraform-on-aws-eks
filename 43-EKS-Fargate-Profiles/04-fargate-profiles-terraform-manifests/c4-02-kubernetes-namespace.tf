# Resource: Kubernetes Namespace fp-ns-app1
# namespace for farget profile pods
resource "kubernetes_namespace_v1" "fp_ns_app1" {
  metadata {
    name = "fp-ns-app1"
  }
}