resource "digitalocean_domain" "default" {
  name       = "victoriarozhina.us"
  ip_address = "${digitalocean_droplet.web-server.ipv4_address}"
}

resource "digitalocean_record" "CNAME-www" {
  domain = "${digitalocean_domain.default.name}"
  type   = "CNAME"
  name   = "www"
  value  = "@"
}
