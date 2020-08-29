provider "kubernetes" {
  config_context_cluster = "minikube"
}
resource "kubernetes_deployment" "task6" {
  metadata {
    name = "mywp"
  }
  spec {
    replicas = 5
    selector {
      match_labels = { 
        env="production"
        app="wordpress"
      }
    }
    template {
      metadata {
        labels = {
        env="production"
        app="wordpress"
        }
      }
      spec {
        container {
          image = "wordpress"
          name  = "mywp-os"
        }
      }
    }
  }
}
resource "kubernetes_service" "ldbalancer" {
  metadata {
    name = "ldbalancer"
  }
  spec {
    selector = {
      env="production"
      app="wordpress"
    }
    
    port {
      node_port = 31000
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}
