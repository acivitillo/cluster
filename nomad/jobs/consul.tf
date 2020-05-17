job "consul" {
  datacenters = ["dc1"]
  group "consul" {
    count = 1
    task "consul" {
      driver = "raw_exec"
            
      config {
        command = "consul"
        args    = ["agent", "-client", "0.0.0.0", "-dev"]
      }
      artifact {
        source = "https://releases.hashicorp.com/consul/1.7.3/consul_1.7.3_linux_amd64.zip"
      }
    }
  }
}