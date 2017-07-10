echo
echo "# enable ip_forward and iptables"
echo "###################"
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.d/99-sysctl.conf
cat >  /etc/cron.d/xluf-iptables-cmd << EOF
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the crontab
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
@reboot root (iptables -t nat -A POSTROUTING -j MASQUERADE)
#
EOF

