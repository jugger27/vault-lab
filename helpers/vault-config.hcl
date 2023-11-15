storage "file" {
  # this path is used so that volume can be enabled https://hub.docker.com/_/vault
  path = "/vault/file"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}

api_addr = "http://127.0.0.1:8200"
ui = true
