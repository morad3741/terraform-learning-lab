#!/bin/bash 
sudo apt-get update
sudo apt-get -y install apache2
echo "<h2>Hello ${instance_id}</h2>"  > /var/www/html/index.html
sudo systemctl start apache2 
sudo systemctl enable apache2