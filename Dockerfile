ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION
LABEL maintainer="AJ Slater <aj@slater.net>"
ARG PKG_VERSION
LABEL version=$VERSION

RUN apk add --no-cache \
    nginx=$PKG_VERSION \
    nginx-mod-http-headers-more=$PKG_VERSION \
    nginx-mod-http-fancyindex=$PKG_VERSION \
    nginx-mod-http-brotli=$PKG_VERSION;

COPY ssl /etc/nginx/ssl
COPY default.conf /etc/nginx/http.d/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
