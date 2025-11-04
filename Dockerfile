FROM wordpress:php8.2-apache

# Install PHP extensions commonly required by plugins
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip \
    && docker-php-ext-enable mysqli gd zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

# ✅ Correct Apache expires config (fixed closing tag)
RUN printf '%s\n' "<IfModule mod_expires.c>\nExpiresActive On\nExpiresByType image/jpg 'access plus 1 month'\nExpiresByType image/jpeg 'access plus 1 month'\nExpiresByType image/gif 'access plus 1 month'\nExpiresByType image/png 'access plus 1 month'\nExpiresByType text/css 'access plus 1 week'\nExpiresByType application/javascript 'access plus 1 week'\n</IfModule>" > /etc/apache2/conf-available/expires.conf && a2enconf expires

EXPOSE 80
CMD ["apache2-foreground"]
