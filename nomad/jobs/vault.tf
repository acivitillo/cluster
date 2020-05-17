job "vault" {
  datacenters = ["dc1"]
  group "vault" {
    count = 1
    task "vault" {
      driver = "raw_exec"
      env {
          VAULT_ADDR = "http://127.0.0.1:8200"
      }
      config {
        command = "vault"
        args    = ["server", "-dev"]
      }
      artifact {
        source      = "https://releases.hashicorp.com/vault/1.4.1/vault_1.4.1_linux_amd64.zip"
      }
    }
  }
}