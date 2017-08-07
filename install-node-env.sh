mkdir -p /etc/apt/sources.list.d
rm /etc/apt/sources.list.d/nodesource.list

proxychains curl https://deb.nodesource.com/setup_8.x | proxychains sudo -E bash -

sudo apt-get install -y nodejs

npm install -g pm2
