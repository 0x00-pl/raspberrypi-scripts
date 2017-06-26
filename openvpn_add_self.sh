SERVER_USER=$1
SERVER_ADDR=$2
SERVER_PASS=$3
SERVER_PORT=$4
SERVER=${SERVER_USER}"@"${SERVER_ADDR}

SSH_OPTION="StrictHostKeyChecking no"

apt-get install -y ssh openvpn sshpass

echo
echo "# getting mac address"
echo "#####################"
ETHMAC=`cat /sys/class/net/eth0/address | sed 'y/:/-/'`
FNAME="client--"${ETHMAC}"--"${SERVER_ADDR}
echo "fname is: ${FNAME}"



echo
echo "# gen client file"
echo "#################"
sshpass -p ${SERVER_PASS} ssh -o "${SSH_OPTION}" ${SERVER} -p ${SERVER_PORT} << EOF
cd /etc/openvpn/easy-rsa/
. ./vars
./revoke-full ${FNAME}
./build-key --batch ${FNAME}
EOF

sshpass -p ${SERVER_PASS} scp -o "${SSH_OPTION}" -P ${SERVER_PORT} ${SERVER}:/etc/openvpn/easy-rsa/keys/${FNAME}.crt /etc/openvpn/
sshpass -p ${SERVER_PASS} scp -o "${SSH_OPTION}" -P ${SERVER_PORT} ${SERVER}:/etc/openvpn/easy-rsa/keys/${FNAME}.key /etc/openvpn/
sshpass -p ${SERVER_PASS} scp -o "${SSH_OPTION}" -P ${SERVER_PORT} ${SERVER}:/etc/openvpn/ca.crt /etc/openvpn/ca.${SERVER_ADDR}.crt

cp ./client.conf /etc/openvpn/client.${SERVER_ADDR}.conf
echo "remote ${SERVER_ADDR} 1194" >> /etc/openvpn/client.${SERVER_ADDR}.conf

echo "ca ca.${SERVER_ADDR}.crt" >> /etc/openvpn/client.${SERVER_ADDR}.conf
echo "cert ${FNAME}.crt" >> /etc/openvpn/client.${SERVER_ADDR}.conf
echo "key ${FNAME}.key" >> /etc/openvpn/client.${SERVER_ADDR}.conf

systemctl start  openvpn@client.${SERVER_ADDR}
systemctl enable openvpn@client.${SERVER_ADDR}

echo
echo "# created file /etc/openvpn/client.${SERVER_ADDR}.conf"
echo "# reboot to enable the openvpn config"

