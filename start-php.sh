#/bin/bash

ROOT_USER="www-data"
ROOT_GROUP="www-data"
DOCUMENT_ROOT="/var/www/html"


echo "${ROOT_USER} ${ROOT_GROUP} ${DOCUMENT_ROOT}"

# nginx -s stop

ps aux | grep nginx | grep -v grep | awk '{print $2}' | xargs kill

sed -i "s/^user .*/user ${ROOT_USER};/" /etc/nginx/nginx.conf
sed -i "s|^\s*root\s\+.*;|    root ${DOCUMENT_ROOT};|" /etc/nginx/conf.d/default.conf

cat /etc/nginx/nginx.conf | grep user
cat /etc/nginx/conf.d/default.conf | grep root

nginx -t

nginx -s reload

nginx -g "daemon off;"