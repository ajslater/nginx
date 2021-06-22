# AJ Nginx

# BREAKING CHANGE 2020-06-21
nginx now looks for vhost configs in /etc/nginx/http.d/ instead of /etc/nginx/conf.d/ as [detailed here](https://github.com/alpinelinux/aports/commit/383ba9c0a200ed1f4b11d7db74207526ad90bbe3)

## Modules

-   [brotli](https://github.com/google/ngx_brotli)
-   [fancyindex](https://www.nginx.com/resources/wiki/modules/fancy_index/)
-   [header-more](https://github.com/openresty/headers-more-nginx-module#readme)

## Config

mount directories in /etc/nginx/http.d/ with confs in the dirs

## Example docker-compose.yaml

```yaml
version: "2"
services:
    your.org_data:
        build: your_nginx_data_dir/
        image: your.org/nginx_data
        container_name: nginx_data
        volumes:
            - /srv/www/your.org
            - /etc/nginx/ssl/your.org
            - /etc/nginx/http.d/your.org
    nginx:
        image: ajslater/nginx
        container_name: nginx
        ports:
            - "80:80"
            - "443:443"
        volumes_from:
            - your.org_data:ro
        environment:
            - PUID=1000
            - GUID=1000
```

## Environment Variables

PUID & PGUID will run the process as a user with that UID and GID. If you omit those variables the process will run as root.

## Repos

-   [Docker Hub](https://hub.docker.com/r/ajslater/nginx)
-   [GitHub](https://github.com/ajslater/nginx)
