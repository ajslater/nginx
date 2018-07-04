FROM alpine:edge

LABEL maintainer="AJ Slater <aj@slater.net>"

RUN apk add nginx nginx-mod-http-headers-more nginx-mod-http-fancyindex; \
   rm -rf /var/cache/apk/*; \
   mkdir /run/nginx;

COPY default.conf /etc/nginx/conf.d/
COPY ssl /etc/nginx/ssl

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
