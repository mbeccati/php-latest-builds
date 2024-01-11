#!/bin/sh

if [ -f Makefile ]; then
  make distclean
fi

./buildconf --force

./configure \
        --prefix=$PHP_DIR \
        $PHP_CONF \
        --enable-debug \
        --without-pear \
        --with-mysqli=mysqlnd \
        --with-pgsql=/usr \
        --enable-pdo \
        --with-pdo-sqlite \
        --with-pdo-mysql=mysqlnd \
        --with-pdo-pgsql=/usr \
        --with-zlib \
        --with-iconv \
        --enable-bcmath \
        --enable-ftp \
        --enable-mbstring \
        --with-curl \
        --with-gettext \
        --enable-intl \
        --enable-sockets \
        --enable-shmop \
        --enable-sysvmsg \
        --enable-sysvsem \
        --enable-sysvshm \
        --enable-soap \
        --enable-fpm \
        --enable-pcntl
