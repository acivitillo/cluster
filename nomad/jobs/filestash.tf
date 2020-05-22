job "filestash" {
  datacenters = ["dc1"]
  type = "service"
  group "filestash" {
    count = 1
    task "filestash" {
      driver = "docker"
      config {
        image = "machines/filestash"
        volumes = [
          "/app_storage/filestash/data:/app/data"
        ]
        port_map {
          http = 8334
        }
      }
      resources {
        network {
          mbits = 10
          port "http" {}
        }
      }
      service {
        name = "filestash"
        tags = [
          "urlprefix-cloud.rifugio.club/",
        ]
        port = "http"
        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}