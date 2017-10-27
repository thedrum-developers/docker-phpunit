FROM thedrum/php:7-fpm-dev
MAINTAINER Chris Shennan <chris@chrisshennan.com>

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
 && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

RUN curl https://phar.phpunit.de/phpunit-5.5.0.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/usr/local/bin/phpunit"]
CMD ["--help"]
