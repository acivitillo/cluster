job "fabio2" {
  datacenters = ["dc1"]
  group "fabio2" {
    count = 1
    task "fabio2" {
      driver = "raw_exec"
      env {
        proxy_addr = ":80;:8300"
      }
      config {
        command = "fabio"
        args    = ["-proxy.strategy=rr"]
      }
      artifact {
        source      = "https://github.com/fabiolb/fabio/releases/download/v1.5.13/fabio-1.5.13-go1.13.4-linux_386"
        destination = "local/fabio"
        mode        = "file"
      }
    }
  }
}