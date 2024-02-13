#!/bin/sh

if [ -z "$PHP" ]; then
  echo "PHP env var missing"
  exit 1
fi

sudo chmod +x $PHP
$PHP -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$PHP -r "if (hash_file('sha384', 'composer-setup.php') === 'edb40769019ccf227279e3bdd1f5b2e9950eb000c3233ee85148944e555d97be3ea4f40c3c2fe73b22f875385f6a5155') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$PHP composer-setup.php
$PHP -r "unlink('composer-setup.php');"1
sudo mv composer.phar /usr/local/bin/composer
