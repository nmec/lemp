#!/usr/bin/env bash

# Nginx src
echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list

# nginx compat libssl
curl -sO http://snapshot.debian.org/archive/debian/20110406T213352Z/pool/main/o/openssl098/libssl0.9.8_0.9.8o-7_amd64.deb
dpkg -i libssl0.9.8_0.9.8o-7_amd64.deb
rm -f libssl0.9.8_0.9.8o-7_amd64.deb

# Nginx keys
curl -sSL http://nginx.org/keys/nginx_signing.key | apt-key add -

