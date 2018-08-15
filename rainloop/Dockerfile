FROM php:5-apache

RUN apt-get update && apt-get install -y unzip

ENV RAINLOOP_URL https://github.com/RainLoop/rainloop-webmail/releases/download/v1.12.1/rainloop-community-1.12.1.zip

RUN rm -rf /var/www/html/ \
 && mkdir -p /var/www/html/rainloop \
 && cd /var/www/html/rainloop \
 && curl -L -O ${RAINLOOP_URL} \
 && unzip *.zip \
 && rm -f *.zip \
 && rm -rf data \
 && find . -type d -exec chmod 755 {} \; \
 && find . -type f -exec chmod 644 {} \; \
 && chown -R www-data: .

RUN mkdir /data
COPY data /data
RUN chown -R www-data:www-data /data
COPY var /var

CMD ["/usr/local/bin/apache2-foreground"]
