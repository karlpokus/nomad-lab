job "loop" {
  datacenters = ["dc1"]
  type = "service"

  group "loop" {
    count = 1

    task "loop" {
      driver = "exec"

      config {
				command = "/usr/local/bin/loop.sh"
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 100 # 256MB
      }
    }
  }
}
