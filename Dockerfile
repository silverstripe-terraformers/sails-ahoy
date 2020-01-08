FROM brettt89/silverstripe-web:7.3-debian-stretch

# Install composer and imagick
RUN apt-get update -y

RUN apt-get install -y libmagickwand-dev
RUN apt-get install -y libmagickwand-6.q16-3

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN pecl install imagick-3.4.3

RUN apt-get remove -y libmagickwand-dev

RUN apt-get install -y libmagickwand-6.q16-3

RUN apt-get autoremove -y

RUN rm -r /var/lib/apt/lists/*

RUN docker-php-ext-enable imagick

COPY memory-limit-php.ini /usr/local/etc/php/conf.d/memory-limit-php.ini
