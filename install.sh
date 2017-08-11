cd `dirname $0`

sudo sh config-keyboard.sh
sudo sh enable-root-ssh.sh
sudo sh install-base-env.sh
sudo sh install-tools.sh
sudo sh install-node-env.sh
sudo sh setup_network/setup_wifi.sh
sudo sh setup_network/enable_ip_forward.sh
sudo sh patch_openresolv/patch.sh
sudo sh config-proxychains.sh
