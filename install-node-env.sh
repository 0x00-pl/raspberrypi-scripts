rm /etc/apt/sources.list.d/nodesource.list
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

apt-get install -y nodejs npm

npm install -g pm2
