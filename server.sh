#!/bin/bash

echo "Server Configuration Started!"

apt install -y sudo curl lsof wget 

echo "update server: "

sudo apt update -y

echo "install webmin : "
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
sh setup-repos.sh

apt install -y webmin

echo "installing php : "

sudo apt install -y php libapache2-mod-php php-common php-mysql

echo "installing mysql : "
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
sudo apt install ./mysql-apt-config_0.8.22-1_all.deb

sudo apt update -y
sudo apt install mysql-server -y

sudo chown -Rv _apt:root /var/cache/apt/archives/partial/
sudo chmod -Rv 700 /var/cache/apt/archives/partial/
