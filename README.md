# strongswan-server-docker
A docker container running a strongswan IPSec server

## Setup

### Generate CA and end certificates

https://docs.strongswan.org/docs/5.9/pki/pkiQuickstart.html

### Setup user/login
Edit _etc/ipsec.secrets_ to add the login/password

## Start the docker container

Run `docker-compose up -d`
