# Odoo Docker multitenant setup
Running Odoo container with Nginx proxy - multi tenant setup, fast and dirty - but works

Prerequisite:
- server with installed Docker and 1GB RAM at least
- docker-compose min ver. 1.8

Build:

docker-compose up -d

Stop:

docker-compose stop

Start:

docker-compose start



### FIXME:

create config for nginx in /nginx/nginx.conf - working example is in repo

next run:

docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres

docker run --name odoo --link db:db -t odoo -- --proxy-mode --db-filter=^%h$

docker run --link odoo:odoo --name nginx -v /nginx/nginx.conf:/etc/nginx/nginx.conf:ro -d -p 80:80 nginx

REMEMBER to change default Odoo master password from admin to something strong... to do this just open in web browser your server address http://ip - you will be redirected to database manager, go to password option and set new MASTER password

when you will create new database for tenant use your master password and replace dots in hostname with dash:

example.com -> example-com

redirecting from www.example.com to example.com is done by nginx
