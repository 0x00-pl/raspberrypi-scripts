echo "# changing dir"
echo "##############"
cd `dirname $0`

echo
echo "# getting mac address"
echo "#####################"
ETHMAC=`cat /sys/class/net/eth0/address`
echo "my eth0 mac addr is: ${ETHMAC}"

apt-get install -y iw hostapd dnsmasq ppp

cp dhcpcd.conf /etc/dhcpcd.conf
cp network/interfaces /etc/network/interfaces
rm -rf /etc/network/interfaces.d/*
cp network/interfaces.d/* /etc/network/interfaces.d/
service dhcpcd start

cp hostapd/hostapd.conf /etc/hostapd/hostapd.conf
echo "ssid=PI_${ETHMAC}" >> /etc/hostapd/hostapd.conf
cp default/hostapd /etc/default/hostapd
service hostapd start

cp dnsmasq.conf /etc/dnsmasq.conf
echo "DNSMASQ_EXCEPT=lo" >> /etc/default/dnsmasq
service dnsmasq start

update-rc.d hostapd enable
update-rc.d dhcpcd enable
update-rc.d dnsmasq enable

