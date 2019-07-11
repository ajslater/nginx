# AJ Nginx

## Modules
* fancyindex
* header-more

## Config
mount directories in /etc/conf.d/ with confs in the dirs

## Example docker-compose.yaml
```yaml
version: '2'
services:
    nginx_data:
        build: your_nginx_data_dir/
        image: your.org/nginx_data
        container_name: nginx_data
        volumes:
            - /config
    nginx:
        image: ajslater/nginx
        container_name: nginx
        ports:
            - "80:80"
            - "443:443"
        volumes_from:
            - nginx_data
```

## Docker Image
https://hub.docker.com/r/ajslater/nginx
