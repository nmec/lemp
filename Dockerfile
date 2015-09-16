FROM php:5.6-fpm

MAINTAINER Jono Warren <jono@justpark.com>

# Add Latest nginx
ADD ./setup.sh /tmp/
RUN /bin/bash /tmp/setup.sh

# Install modules
RUN apt-get update && apt-get install -y \
	libpng12-dev \
	libjpeg-dev \
	nginx \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install mysqli gd \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
