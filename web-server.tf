resource "digitalocean_droplet" "web-server" {
  image              = "centos-7-x64"
  name               = "web-server"
  region             = "nyc1"
  size               = "512mb"
  private_networking = true

  ssh_keys = [
    "${var.ssh_fingerprint}",
  ]

  connection {
    user        = "centos"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "uname -a",
    ]
  }
}
