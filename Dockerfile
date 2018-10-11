FROM nginx:1.15.4-alpine

LABEL license="Apache License, Version 2.0"
LABEL copyright="CS Systèmes d'Information"
LABEL maintainer="contact@ikats.org"
LABEL version="0.7.40"

COPY assets/nginx.conf /etc/nginx/nginx.conf
COPY assets/container_init.sh /

# Run a script to replace target dependent values into the templated nginx configuration
ENTRYPOINT ["sh", "/container_init.sh"]