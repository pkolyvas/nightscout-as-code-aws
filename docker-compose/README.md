# Nightscout-as-Code Docker-Caddy-Proxy

This one-stop-shop docker-compose file will 

# Requirements
- This configuration expects that the machine where it is run has either:
  - A public IP with a domain pointing to that IP
  - Rules on the network router/firewall with port forward TCP 80 and TCP 443 to the machine and a domain which is pointing at the router's WAN address.

# Instructions

1. Edit `line 34` of the `docker-compose.yml` to the domain name you intend to use. 
2. `docker network create caddy`
3. `docker-compose up -d`

That's it! [Docker-Caddy-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy) will configure everything, including acquiring a TLS certificate for you. 
