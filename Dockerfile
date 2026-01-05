# =================================================================
# Development image
# =================================================================
FROM ghcr.io/serversideup/php:8.2-fpm-nginx AS development

LABEL maintainer="Ali Salehi <alisalehi.dev@gmail.com>"

USER root

# mariadb-client | for Spatie Backup
RUN install-php-extensions intl exif soap xdebug \
  && apt-get update \
  && apt-get install -y \
    mariadb-client \
    iputils-ping \
    curl \
    gnupg \
  && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Configure shell aliases
RUN echo "alias ll='ls -al'" >> /etc/bash.bashrc && \
    echo "alias a='php artisan'" >> /etc/bash.bashrc && \
    echo "alias c='composer'" >> /etc/bash.bashrc && \
    \
    echo "alias logs='tail -n 100 -f storage/logs/laravel.log'" >> /etc/bash.bashrc && \
    echo "alias amfs='a migrate:fresh --seed'" >> /etc/bash.bashrc && \
    echo "alias aoc='a optimize:clear'" >> /etc/bash.bashrc && \
    \
    echo "alias am:fi-r='a make:filament-resource'" >> /etc/bash.bashrc && \
    echo "alias am:fi-rm='a make:filament-relation-manager'" >> /etc/bash.bashrc && \
    echo "alias am:fi-w='a make:filament-widget'" >> /etc/bash.bashrc

USER www-data
