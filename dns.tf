data "digitalocean_domain" "rancher" {
  name = "plgrnd.be"
}

resource "digitalocean_record" "rancher" {
  domain = data.digitalocean_domain.rancher.name
  type   = "A"
  name   = "rancher-vsphere-demo"
  value  = vsphere_virtual_machine.rancher_server[0].default_ip_address
  ttl    = 60
}
