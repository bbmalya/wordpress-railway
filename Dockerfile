FROM wordpress:php8.2-apache

# Install PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip \
    && docker-php-ext-enable mysqli gd zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

# ✅ Fixed Apache expires config (correct escape and syntax)
RUN echo '<IfModule mod_expires.c>\n\
ExpiresActive On\n\
ExpiresByType image/jpg "access plus 1 month"\n\
ExpiresByType image/jpeg "access plus 1 month"\n\
ExpiresByType image/gif "access plus 1 month"\n\
ExpiresByType image/png "access plus 1 month"\n\
ExpiresByType text/css "access plus 1 week"\n\
ExpiresByType application/javascript "access plus 1 week"\n\
</IfModule>' > /etc/apache2/conf-available/expires.conf \
    && a2enconf expires

EXPOSE 80
CMD ["apache2-foreground"]
