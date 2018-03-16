sudo apt install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update -y
apt-cache pkgnames | grep php7.1
sudo apt -y install php7.1
sudo service apache2 stop
sudo systemctl disable apache2
