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
      "sudo yum -y update",
    ]
  }

  provisioner "local-exec" {
    command = "doctl compute droplet-action reboot ${digitalocean_droplet.web-server.id}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install epel-release",
      "sudo yum -y install nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo bash -c \"echo 'this website is being recreated' > /usr/share/nginx/html/index.html\"",
    ]
  }
}
