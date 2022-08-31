# Nightscout-as-Code Docker-Caddy-Proxy

A one stop shop docker-compose file that uses Caddy-Docker-Proxy to configure the reverse proxy and provision a TLS cert automatically.

# Requirements
- This configuration expects that the host where it is run has either:
  - A public IP with a domain pointing to that IP
  - Rules on the network router/firewall with port forward TCP 80 and TCP 443 to the host and a domain which is pointing at the router's WAN address.
- A host with the Docker Container Engine and Docker Compose installed

# Instructions

1. Pick the amd64 or arm64 version of the file.
2. Edit `line 34` of the `docker-compose.yml` to the domain name you intend to use. 
3. Edit `line 69` with the nice password you'd like to use to access Nightscout.
4. Run `docker network create caddy`
5. Run `docker-compose up -d` in the same directory as your `docker-compose.yml` file.

That's it! [Docker-Caddy-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy) will configure everything, including acquiring a TLS certificate for you. 
