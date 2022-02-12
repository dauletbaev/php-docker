# PHP obrazin dokcerhub dan alamiz
FROM php:7.4-fpm-alpine

# Jumis papkasin tomendegishe ozgertemiz
WORKDIR /var/www/html

# Bul jerde developmentke tuwirlap atirganimiz ushin
# xdebugti ornatamiz
RUN apk update && apk add \
    build-base \
    --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.9.2 \
    && docker-php-ext-enable xdebug

# PDO menen (MySQL) ushin qosimshani ornatamiz
RUN docker-php-ext-install pdo_mysql

# www toparin jaratamiz
RUN addgroup -g 1000 -S www && \
    adduser -u 1000 -S www -G www

USER www

COPY --chown=www:www . /var/www/html

EXPOSE 9000