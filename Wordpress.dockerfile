FROM wordpress:5.7.2-fpm-alpine

# Install required PHP extensions
RUN apk add --no-cache \
    php7-mysqli \
    php7-curl \
    php7-gd \
    php7-intl \
    php7-mbstring \
    php7-soap \
    php7-xml \
    php7-xmlrpc \
    php7-zip \
    php7-opcache

# Copy custom configuration files
COPY php.ini /usr/local/etc/php/
COPY wp-config.php /var/www/html/
COPY custom-entrypoint.sh /usr/local/bin/

# Set permissions
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]
CMD ["php-fpm"]
