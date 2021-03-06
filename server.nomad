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

			check {
        type = "http"
        port = "http"
				path = "/health"
        interval = "10s"
        timeout = "2s"
      }
		}

    task "server" {
      driver = "exec"
      config {
				command = "bin/linux/http-server"
      }
			env {
				API_HOST = "api.service.consul"
			}
			artifact {
        source = "https://github.com/karlpokus/nomad-lab/releases/download/v0.2.0/http-server.zip"
        options {
          checksum = "md5:89dc754cc7e0cfe9f9d5501b7ec6c459"
        }
      }
      resources {
        cpu    = 500 # MHz
        memory = 50 # MB
      }
    }
  }
}
