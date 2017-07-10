echo
echo "# setup sshd"
echo "###############"
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
service sshd restart

