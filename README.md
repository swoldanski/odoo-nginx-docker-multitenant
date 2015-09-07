# Odoo Nginx Docker multitenant setup
Running Odoo container with Nginx proxy - multi tenant setup, fast and dirty - just memo

Prerequisite:
- host with installed Docker like CoreOS or Ubuntu

create config for nginx in /nginx/nginx.conf - working example is in repo
next run:

docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres
docker run --name odoo --link db:db -t odoo -- --proxy-pass --db-filter=^%h$
docker run --link odoo:odoo --name nginx -v /nginx/nginx.conf:/etc/nginx/nginx.conf:ro -d -p 80:80 nginx

REMEMBER to change default Odoo master password from admin to something strong...
just open in web browser your server address http://example.com - you will be redirected to database manager

when you will create new database for tenant repleace dots in hostname with dash, example:

example.com -> example-com

