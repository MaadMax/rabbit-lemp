#!/bin/bash
#
# author: Maxime LAFARIE
# website: www.maximelafarie.com
# date: 15/10/2015
#
# This bash script setup an nginx server with MariaDB and APC Cache
# It is supposed you are logged as root and your server runs Debian 7 Wheezy or Debian 8 Jessie
#

# Variables definition
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

printf "\n${GREEN}What is your current version of Debian? Debian 7 Wheezy = 1 | Debian 8 Jessie = 2${NC}\n"
read OSversion

if [ $OSversion != "1" ] && [ $OSversion != "2" ]
then
	printf "\n${RED}I cannot understand your OS version. Please retry.${NC}\n"
	ScriptLoc=$(readlink -f "$0")
	exec "$ScriptLoc"
fi

printf "\n${GREEN}Update kernel and packets${NC}\n"
apt-get update && apt-get upgrade -y

printf "\n${GREEN}Install htop, zip unzip${NC}\n"
apt-get install htop zip unzip -y

printf "\n${GREEN}Install NGINX Server${NC}\n"
apt-get install nginx -y

printf "\n${GREEN}Install PHP5 FPM and CLI${NC}\n"
apt-get install php5-cli -y
apt-get install php5-fpm -y
apt-get install php5-mysql curl php5-curl php5-intl php5-tidy php5-xsl php5-mcrypt php5-imap -y

php5enmod mcrypt
php5enmod imap

printf "\n${GREEN}Restarting NGINX...${NC}\n"
service nginx restart

printf "\n${GREEN}Restarting PHP5 FPM...${NC}\n"
service php5-fpm restart

printf "\n${GREEN}Install MariaDB${NC}\n"
apt-get install software-properties-common -y
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db

if [ $OSversion = "1" ]
then
	add-apt-repository 'deb [arch=amd64,i386] http://fr.mirror.babylon.network/mariadb/repo/10.1/debian wheezy main'
elif [ $OSversion = "2" ]
then
	add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://fr.mirror.babylon.network/mariadb/repo/10.1/debian jessie main'
fi

apt-get update
apt-get install mariadb-server -y

printf "\n${GREEN}Install APC Cache${NC}\n"
apt-get install php-apc -y

printf "\n${GREEN}Modifying config...${NC}\n"
echo '' >> /etc/php5/fpm/php.ini
echo '[APC]' >> /etc/php5/fpm/php.ini
echo 'apc.enabled=1' >> /etc/php5/fpm/php.ini
echo 'apc.shm_size=256M' >> /etc/php5/fpm/php.ini
echo 'apc.stat=1' >> /etc/php5/fpm/php.ini
echo '' >> /etc/php5/fpm/php.ini

printf "\n${GREEN}Restarting NGINX and PHP5 FPM...${NC}\n"
service php5-fpm restart
service nginx restart

#Unset no more used variables
unset GREEN
unset NC

exit 0
