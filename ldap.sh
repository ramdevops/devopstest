apt-get update && 
apt-get upgrade -y && 
apt-get install build-essential -y &&

apt-get install slapd ldap-utils &&

sudo dpkg-reconfigure slapd &&

sudo apt-get install phpldapadmin &&
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt &&

sudo apt-get install apache2-utils