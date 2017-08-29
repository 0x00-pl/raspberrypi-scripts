mkdir -p /etc/apt/sources.list.d
rm -f  /etc/apt/sources.list.d/nodesource.list

#curl https://deb.nodesource.com/setup_8.x | sudo -E bash -
cat proxychains_setup_8.x | sudo -E bash -

sudo apt-get install -y --allow-unauthenticated nodejs

sudo npm install -g pm2
