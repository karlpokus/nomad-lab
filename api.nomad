job "api" {
  datacenters = ["dc1"]
  type = "service"

  group "api" {
    count = 2
		network {
			port "http" {} # dynamic port alloc
		}

		service { # register w consul
			name = "api"
			port = "http"

			check {
        type = "http"
        port = "http"
				path = "/health"
        interval = "10s"
        timeout = "2s"
      }
		}

    task "api" {
      driver = "exec"
      config {
				command = "bin/linux/http-api"
      }
			artifact {
        source = "https://github.com/karlpokus/nomad-lab/releases/download/v0.2.0/http-api.zip"
        options {
          checksum = "md5:608e713326ed0b163b3107fcc17b23ff"
        }
      }
      resources {
        cpu    = 500 # MHz
        memory = 50 # MB
      }
    }
  }
}
