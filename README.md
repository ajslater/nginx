# AJ Nginx

## Modules

- [brotli](https://github.com/google/ngx_brotli)
- [fancyindex](https://www.nginx.com/resources/wiki/modules/fancy_index/)
- [header-more](https://github.com/openresty/headers-more-nginx-module#readme)

## Config

mount directories in /etc/conf.d/ with confs in the dirs

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
      - /etc/nginx/config.d/your.org
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

## Docker Image

[ajslater/nginx](https://hub.docker.com/r/ajslater/nginx)
