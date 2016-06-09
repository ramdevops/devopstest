apt-get update && 
apt-get upgrade -y && 
apt-get install build-essential -y &&

sudo ntpdate pool.ntp.org && 

sudo apt-get update && sudo apt-get -y install ntp


wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb


sudo dpkg -i puppetlabs-release-trusty.deb


sudo apt-get update


sudo apt-get install puppetmaster-passenger

