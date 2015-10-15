#!/bin/bash
#
# author: Maxime LAFARIE
# website: www.maximelafarie.com / www.arcadmedia.com
# date: 15/10/2015
#
# This bash script setup an nginx server with MariaDB and APC Cache
# It is supposed you are logged as root and your server runs Debian 7 Wheezy or Debian 8 Jessie
#

# Variables definition
RED='\033[0;31m'

printf "${RED}Update kernel and packets"
apt-get update && apt-get upgrade -y

printf "${RED}Install htop, zip unzip"
apt-get install htop zip unzip

printf "${RED}Install NGINX Server"
apt-get install nginx

printf "${RED}Install PHP5 FPM and CLI"
apt-get install php5-cli
apt-get install php5-fpm
apt-get install php5-mysql curl php5-curl php5-intl php5-tidy php5-xsl php5-mcrypt php5-imap

php5enmod mcrypt
php5enmod imap

printf "${RED}Restarting NGINX..."
service nginx restart

printf "${RED}Restarting PHP5 FPM..."
service php5-fpm restart

printf "${RED}Install MariaDB"
apt-get install python-software-properties
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository 'deb http://mirror6.layerjet.com/mariadb/repo/10.1/debian wheezy main'
apt-get update
apt-get install mariadb-server

printf "${RED}Install APC Cache"
apt-get install php-apc

printf '${RED}Modifying config...'
sed  '/\[CLI Server\]/i [APC]' input
sed  '/\[CLI Server\]/i apc.enabled=1' input
sed  '/\[CLI Server\]/i apc.shm_size=256M' input
sed  '/\[CLI Server\]/i apc.stat=1' input
sed  '/\[CLI Server\]/i ' input

printf "${RED}Restarting NGINX and PHP5 FPM..."
service php5-fpm restart
service nginx restart


exit 0