#!/bin/bash

if [[ -z "$PHP" || -z "$PHP_DIR" ]]; then
  echo "PHP env var missing"
  exit 1
fi

# Setup PHP executables
sudo chmod +x $PHP_DIR/bin/*


# Composer
EXPECTED_CHECKSUM="$($PHP -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
$PHP -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$($PHP -r "echo hash_file('sha384', 'composer-setup.php');")"

if [[ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]]; then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

$PHP composer-setup.php --quiet
rm composer-setup.php

sudo mv composer.phar /usr/local/bin/composer

if [[ "$GITHUB_TOKEN" != "" ]]; then
    $PHP /usr/local/bin/composer config --global --auth github-oauth.github.com "$GITHUB_TOKEN"
fi

# PIE
sudo curl -sL --output /usr/local/bin/pie https://github.com/php/pie/releases/latest/download/pie.phar
sudo chmod +x /usr/local/bin/pie
