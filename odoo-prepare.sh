mkdir /nginx
cp ./nginx.conf /nginx
docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres
docker run -d --name odoo --link db:db -t odoo --proxy-mode --db-filter=^%h$
docker run --link odoo:odoo --name nginx -v /nginx/nginx.conf:/etc/nginx/nginx.conf:ro -d -p 80:80 nginx
