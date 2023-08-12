#!/bin/sh


# envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
sed -i 's/WEB_APP_URL/$WEB_APP_URL/g' /nginx.conf.template
mv /nginx.conf.template /etc/nginx/nginx.conf
nginx
# -g "daemon off;"