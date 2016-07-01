FROM nginx:1.11-alpine

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf.template /etc/nginx/conf.d/default.conf.template

ENV NGINX_PORT=80 PROXY_PORT=8080 PROXY_HOST=127.0.0.1

CMD /bin/sh -c "envsubst '\$NGINX_PORT \$PROXY_PORT \$PROXY_HOST' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
