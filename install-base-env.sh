mv /etc/apt/sources.list /etc/apt/sources.list.back
mv /etc/apt/sources.list.d /etc/apt/sources.list.d.back
cat > /etc/apt/sources.list << EOF
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ jessie main contrib non-free
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ jessie main contrib non-free
#deb http://raspbian.cnssuestc.org/raspbian/ jessie main contrib non-free
#deb-src http://raspbian.cnssuestc.org/raspbian/ jessie main contrib non-free
#deb http://mirrors.zju.edu.cn/raspbian/raspbian/ jessie main contrib non-free
#deb-src http://mirrors.zju.edu.cn/raspbian/raspbian/ jessie main contrib non-free
#deb http://mirrors.cqu.edu.cn/Raspbian/raspbian/ jessie main contrib non-free
EOF

wget http://archive.raspbian.org/raspbian.public.key -O - | apt-key add -

apt-get clean
apt-get update
apt-get install --force-yes apt-transport-https netselect-apt
netselect-apt -o /etc/apt/sources.list

apt-get update
apt-get install --force-yes aptitude git python3 build-essential

