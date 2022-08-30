# Nightscout as Code 

# NaC on AWS

This repo contains all the pieces of to run Nightscout-as-Code (NaC). With a few straightforward commands you'll be able to spin up and run Nightscout.

## Goal

The goal of this project is to make it *relatively* straightforward to deploy Nightscout CGM, on almost any platform, now that Heroku no longer offers a free tier.
## Approach

This project * **does not** provide a free alternative* to Heroku. Rather it takes the position that these files can be easily run anywhere. We've even provided the ability to spin up and run Nightscout on AWS with very little effort.

## Caveats

This is still fairly technical. However, taking the codified approach over the GUI approach has some benefits, namely that the number of things which are difficult to troubleshoot are reduced, as well as ease-of-iteration when one is trying to get something to run.

## What's in the box

It has several components:

- [Nightscout]() (run via docker image)
- [MongoDB]() (run via docker image)
- [Caddy](https://github.com/caddyserver/caddy)
- [Caddy-Docker-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy)

## Requirements

- You'll need a domain name routed to the correct
- Command-line access to a host for configuration and setup.

## Usage

[TODO]

## Extras

[TODO]