FROM php:8.2-cli-alpine

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions; \
    apk add --update binutils; \
    install-php-extensions \
        xdebug \
	redis \
        opentelemetry

WORKDIR /usr/src/myapp

RUN   apk add --no-cache bash git; \
      find /usr/local/lib/php/extensions -type d -exec chmod +x -R {} \;; \
      addgroup -g "1000" -S php; \
      adduser --system \
        --gecos "" \
        --ingroup "php" \
        --uid "1000" \
        "php";
