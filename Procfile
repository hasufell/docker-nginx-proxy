nginx: openssl dhparam -out /etc/nginx/dh4096.pem 4096 && nginx -g "daemon off;"
dockergen: docker-gen -watch -only-exposed -notify "nginx -s reload" /app/nginx.tmpl /etc/nginx/sites-enabled/default.conf
