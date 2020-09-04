job "server" {
  datacenters = ["dc1"]
  type = "service"

  group "server" {
    count = 2
		network {
			port "http" {} # dynamic port alloc
		}

		service { # register w consul
			name = "server"
			port = "http"
		}

    task "server" {
      driver = "exec"
      config {
				command = "bin/linux/http-server"
      }
			artifact {
        source = "https://github.com/karlpokus/nomad-lab/releases/download/v0.1.0/http-server.zip"
        options {
          checksum = "md5:290249937cacbe2ff91c979d26b6eb2c"
        }
      }
      resources {
        cpu    = 500 # MHz
        memory = 50 # MB
      }
    }
  }
}
