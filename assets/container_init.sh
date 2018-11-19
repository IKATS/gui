#! /bin/sh

set -e

for v in "${HOST}" "${TOMCAT_ADDR}" "${TOMCAT_PORT}" "${GUNICORN_ADDR}" "${GUNICORN_PORT}" "${TOMEE_ADDR}" "${TOMEE_PORT}" "${OPENTSDB_ADDR}" "${OPENTSDB_PORT}"
do
  [ -z "$v" ] && echo "The environment variable ${v} must have a value" && exit 1
done

echo "All variables are correctly set. Starting nginx"

# Substitute environment variables in configuration file before calling nginx
envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'

echo "nginx stopped"