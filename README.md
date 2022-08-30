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

It has several components:

- [Nightscout]() (run via docker image)
- [MongoDB]() (run via docker image)
- [Caddy](https://github.com/caddyserver/caddy)
- [Caddy-Docker-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy)

## Requirements

Your requiremetns will differ depending on which path you choose to take.

The lowest effort path is the AWS path at the moment. It has two requirements:
- Sign up for an AWS account
- Retrieve your AWS credentials
- Use AWS to register a domain name
- Sign up for Terraform Cloud's free tier

We've created a guide you can follow here: 

Otherwise:

- You'll need a domain name routed to the correct
- Command-line access to a host for configuration and setup.

## Usage

[TODO]

## Extras

[TODO]