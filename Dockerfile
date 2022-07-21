FROM php:8-apache

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

COPY  upload/ /var/www/html 

RUN install-php-extensions gd zip mysqli

HEALTHCHECK --interval=30s --timeout=1s --start-period=5s --retries=3 CMD [ "curl", "-I", "http://localhost/robots.txt" ]

CMD ["chmod", "-R", "777", "/var/www/html"]
