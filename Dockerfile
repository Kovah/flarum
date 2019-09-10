## Install dependencies with Composer
FROM composer:1.8 AS composer
WORKDIR /srv

COPY composer.json composer.lock ./

RUN composer install --ignore-platform-reqs --no-scripts


## Build the main image
FROM php:7.3-fpm
WORKDIR /srv

# Install dependencies
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
        libpng-dev \
        curl \
        nginx; \
    docker-php-ext-install \
        mysqli \
        gd \
        opcache \
        pdo_mysql;

# Configure Nginx
RUN rm -f /etc/nginx/sites-enabled/default

COPY docker/nginx.conf /etc/nginx/conf.d/site.conf

COPY docker/php.ini /usr/local/etc/php/php.ini

COPY docker/docker-app-entrypoint /usr/local/bin/

# Copy application files
COPY . .

# Prepare storage folders
RUN chown -R www-data /srv;
RUN chmod 0775 /srv;
RUN chmod 0775 /srv/public/assets;

# Copy composer dependencies
COPY --from=composer /srv/vendor /srv/vendor

# Expose web port
EXPOSE 80
ENTRYPOINT ["docker-app-entrypoint"]
