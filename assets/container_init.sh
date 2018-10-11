#! /bin/sh

set -e

function test_for_variable {
  vname=$1
  vvalue=${!vname}
  default_value=$2

  if [ -z "$vvalue" ]
  then
    if [ -z "$2" ]
    then
      # No fallback has been given to the function
      echo "The environment variable ${vname} must have a value"
      exit 1
    else
      # Setting the variable value to the provided default
      eval $vname=$default_value
    fi
  fi
}

for v in "${HOST}" "${TOMCAT_ADDR}" "${TOMCAT_PORT}" "${GUNICORN_ADDR}" "${GUNICORN_PORT}" "${TOMEE_ADDR}" "${TOMEE_PORT}" "${OPENTSDB_ADDR}" "${OPENTSDB_PORT}"
do
  [ -z "$v" ] && echo "The environment variable ${v} must have a value" && exit 1
done

echo "All variables are correctly set. Starting nginx"


# Substitute environment variables in configuration file before calling nginx
envsubst < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf && nginx -g 'daemon off;'

echo "nginx stopped"