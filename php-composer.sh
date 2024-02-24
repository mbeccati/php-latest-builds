#!/bin/sh

if [ -z "$PHP" ]; then
  echo "PHP env var missing"
  exit 1
fi

sudo chmod +x $PHP

EXPECTED_CHECKSUM="$($PHP -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
$PHP -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$($PHP -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

$PHP composer-setup.php --quiet
rm composer-setup.php

sudo mv composer.phar /usr/local/bin/composer
