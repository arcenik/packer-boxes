variable "architecture" {
  type    = string
  default = "arm64"
}

variable "hcp_client_id" {
  type    = string
  default = "${env("HCP_CLIENT_ID")}"
}

variable "hcp_client_secret" {
  type    = string
  default = "${env("HCP_CLIENT_SECRET")}"
}

locals {
  version = "1.0.${formatdate("YYYYMMDD.hhmmss", timestamp())}"
}
