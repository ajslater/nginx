ARG BASE_VERSION
FROM ajslater/alpine-base:$BASE_VERSION
LABEL maintainer="AJ Slater <aj@slater.net>"
ARG ALPINE_VERSION
ARG PKG_VERSION
LABEL version=${ALPINE_VERSION}_${PKG_VERSION}

RUN apk add --no-cache \
    nginx=$PKG_VERSION \
    nginx-mod-http-headers-more=$PKG_VERSION \
    nginx-mod-http-fancyindex=$PKG_VERSION;
RUN mkdir /run/nginx;

COPY ssl /etc/nginx/ssl
COPY default.conf /etc/nginx/conf.d/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
