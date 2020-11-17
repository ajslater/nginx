#!/bin/bash
echo "{\"experimental\": true}" > /etc/docker/daemon.json
systemctl restart docker
