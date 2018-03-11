#!/usr/bin/env bash

yum install -y libxml2-devel
yum group install -y 'Development Tools' && yum install -y wget vim

wget -O php-5.6.34.tar.gz http://sg2.php.net/get/php-5.6.34.tar.gz/from/this/mirror && tar zxf php-5.6.34.tar.gz

cd php-5.6.34

# ./configure --help
./configure \
--prefix=/usr/local/php/php-5.6.34 \
--with-config-file-path=/usr/local/php/php-5.6.34/etc/php.ini \
--with-config-file-scan-dir=/usr/local/php/php-5.6.34/etc/php.d \
--enable-fpm \
--enable-opcache \
--with-mysqli

make
make install

cp php.ini-development /usr/local/php/php-5.6.34/etc/php.ini
cp /usr/local/php/php-5.6.34/etc/php-fpm.conf.default /usr/local/php/php-5.6.34/etc/php-fpm.conf

ln -s /usr/local/php/php-5.6.34 /usr/local/php/current

/usr/local/php/current/sbin/php-fpm
