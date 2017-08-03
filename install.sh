cd `dirname $0`

sudo sh enable_root_ssh.sh
sudo sh install-base-env.sh
sudo sh install-tools.sh
sudo sh install-node-env.sh
sudo sh setup_network/setup_wifi.sh
sudo sh setup_network/enable_ip_forward.sh
sudo sh patch_openresolv/patch.sh
