#!/bin/sh

if [ -f Makefile ]; then
  make distclean
fi

./buildconf --force

./configure \
        --prefix=$PHP_DIR \
        $PHP_CONF \
        --enable-bcmath \
        --enable-debug \
        --enable-fpm \
        --enable-ftp \
        --enable-intl \
        --enable-mbstring \
        --enable-pcntl \
        --enable-pdo \
        --enable-shmop \
        --enable-sockets \
        --enable-soap \
        --enable-sysvmsg \
        --enable-sysvsem \
        --enable-sysvshm \
        --with-curl \
        --with-gettext \
        --with-iconv \
        --with-mysqli=mysqlnd \
        --with-openssl \
        --with-pdo-mysql=mysqlnd \
        --with-pdo-pgsql=/usr \
        --with-pdo-sqlite \
        --with-pgsql=/usr \
        --with-pear \
        --with-xsl \
        --with-zlib \
        --with-zip
