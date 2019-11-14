FROM brettt89/silverstripe-web:7.3-debian-stretch

# Install composer and imagick
RUN apt-get update -y && \
    curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    pecl install imagick-3.4.3 && \
    apt-get remove -y libmagickwand-dev && \
    apt-get install -y libmagickwand-6.q16-3 && \
    apt-get autoremove -y && \
    rm -r /var/lib/apt/lists/* && \
    docker-php-ext-enable imagick
