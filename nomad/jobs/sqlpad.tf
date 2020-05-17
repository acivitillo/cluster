job "sqlpad" {
  datacenters = ["dc1"]
  type = "service"
  group "sqlpad" {
    count = 1
    task "sqlpad" {
      driver = "docker"
      config {
        image = "sqlpad/sqlpad:latest"
        port_map {
          http = 3000
        }
        volumes = [
          "/app_storage/sqlpad:/var/lib/sqlpad"
        ]
      }
      resources {
        network {
          mbits = 10
          port "http" {}
        }
      }
      service {
        name = "sqlpad"
        tags = [
          "urlprefix-sqlpad.rifugio.club/",
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