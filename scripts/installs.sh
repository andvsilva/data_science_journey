#!/bin/bash

echo "updating the server..."
sudo apt install update
sudo apt install upgrade -y
sudo apt install apache2 -y
sudo apt install unzip -y

echo "downloading and setting everything..."

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio
cp -R * /va/www/html/

