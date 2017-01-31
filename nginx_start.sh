#!/bin/bash

	echo "Installing NGINX.."
	sudo yum -y install nginx >/dev/null
	echo "Change owner /etc/nginx/ to vagrant"
	sudo chown -R vagrant:vagrant /etc/nginx/
	echo "Add virtual host config file"
	sudo echo "server {server_name 172.27.10.59;listen 80;location / {proxy_pass http://172.27.10.60:8080;proxy_pass_request_headers on;}}">>/etc/nginx/conf.d/vhost.conf
	echo "Try to start nginx"
	sudo /etc/init.d/nginx start


