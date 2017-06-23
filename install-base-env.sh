mv /etc/apt/sources.list /etc/apt/sources.list.back
mv /etc/apt/sources.list.d /etc/apt/sources.list.d.back
cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/raspbian/raspbian stable main contrib non-free
deb-src https://mirrors.ustc.edu.cn/raspbian/raspbian stable main contrib non-free
EOF

wget http://archive.raspbian.org/raspbian.public.key -O - | apt-key add -

apt-get update
apt-get install -y --force-yes aptitude git python3 build-essential proxychains sshfs

