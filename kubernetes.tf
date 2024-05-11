################################################################################
# K8S Resource
################################################################################

resource "kubernetes_namespace" "main" {
  metadata {
    name = "mario-deployment"
  }
}
resource "kubernetes_deployment" "main" {
  metadata {
    name      = "mario-deployment"
    namespace = kubernetes_namespace.main.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "mario"
      }
    }
    template {
      metadata {
        labels = {
          app = "mario"
        }
      }
      spec {
        container {
          image = "sevenajay/mario:latest"
          name  = "mario-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "main" {
  metadata {
    name      = "mario-service"
    namespace = kubernetes_namespace.main.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.main.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 80
    }
  }
}