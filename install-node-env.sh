mkdir -p /etc/apt/sources.list.d
rm /etc/apt/sources.list.d/nodesource.list
cat setup_8.x | sudo -E bash -

apt-get install -y nodejs

npm install -g pm2
