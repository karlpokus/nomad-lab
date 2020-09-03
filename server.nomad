job "server" {
  datacenters = ["dc1"]
  type = "service"

  group "server" {
    count = 2

		network {
			port "http" {} # dynamic port alloc
		}

    task "server" {
      driver = "exec"

      config {
				command = "/usr/local/bin/server"
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 100 # 256MB
      }
    }
  }
}
