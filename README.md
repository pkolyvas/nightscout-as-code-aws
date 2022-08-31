# Nightscout as Code 

**Note: this is a work-in-progress and should not be used until this notice is removed**

This repo contains all the pieces of to run Nightscout-as-Code (NaC). With a few straightforward commands you'll be able to spin up and run Nightscout.

## Goal

The goal of this project is to make it *relatively* straightforward to deploy Nightscout CGM, on almost any platform, now that Heroku no longer offers a free tier.

It's important to note that this is still fairly technical. However, taking the codified approach over the GUI approach has some benefits:
- More straightforward for others to troubleshoot, because they can see exactly what's happening
- Quickly copy this repository as a template
- Quicky modify the templates for use with your flavour of, well, anything
- Most importantly it allows you to track any changes you make and revert more easily than clicking a button somewhere
## Approach

This project ***does not** provide a free alternative to Heroku*. Rather it takes the position that these files can be easily run anywhere. We've even provided the ability to spin up and run Nightscout on AWS with very little effort.

## What's in the box

Every iteration herein is relies on a few key components:

- [Nightscout]() (run via docker image)
- [MongoDB]() (run via docker image)
- [Caddy](https://github.com/caddyserver/caddy)
- [Caddy-Docker-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy)

We use the awesome [Caddy-Docker-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy) to configure the reverse-proxy and automatically provision a TLS

## Types of installs

There are two paths at the moment:
1. The AWS path via Terraform   
2. The Docker Compose path

### Choosing the AWS path via Terraform

*Note: If you're already familier with Terraform's Open Source CLI tool, you can probably just fork the repo and make any necessary changes.*

This path is designed to be relatively low effort with a few basic steps and requirements. The high level steps are:
- Sign up for a GitHub account and fork this repository
- Sign up for an AWS account
- Retrieve your AWS credentials
- Use AWS to register a domain name
- Sign up for Terraform Cloud's free tier
- Use Terraform Cloud to tie it all together and push a button to get your nightscout

We've created (or are creating at the time of this commit) a guide you can follow here: [https://github.com/pkolyvas/nightscout-as-code/wiki](https://github.com/pkolyvas/nightscout-as-code/wiki)

### Choosing the Docker Compose path

The docker compose path puts the onus on you to configure and manage everything up to the host. You're responsible for domain hosting, networking, and the host intance. We're the kind of folks that find this stuff fun, but if you're unfamiliar with a lot of the tooling/software involved you may want to start with the AWS path via Terraform Cloud.


## Usage

[TODO]

## Extras

[TODO]

## Supporting this project

If you want to contribute here, that's fine. As for other forms of support, we highly recommend you support the Nightscout project, or other projects like LoopKit, more directly. Or simply join the Nightscout/We Are Not Waiting Discord and offer help to those who might need it. 