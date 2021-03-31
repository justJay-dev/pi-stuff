# ssh ubuntu@whatever


#hostname
#s3-N storage
#mk-N mk8s cluster
#pi-N general appliance

#one liners
export HOSTNAME=whatever

sudo hostnamectl set-hostname $HOSTNAME
sudo echo "preserve_hostname: true" > /etc/cloud/cloud.cfg
sudo echo "127.0.0.1 $HOSTNAME" > /etc/hosts
sudo echo "network: {config: disabled}" > /etc/cloud/cloud.cfg.d./99-disable-network-config.cfg

#ORRRR
sudo vim /etc/hosts
127.0.0.1 HOSTNAME

sudo vim /etc/cloud/cloud.cfg
preserve_hostname: true

# static nic for ubuntu arm
sudo vim /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
#paste this
network: {config: disabled}

# then do 
sudo vim /etc/netplan/01-netcfg.yaml
# and paste
# 60-69 cluster
# 30-39 storage
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.1.60/24
      gateway4: 192.168.1.1
      nameservers:
          addresses: [192.168.1.70, 1.1.1.1]
          
 #then 
 sudo netplan apply
 
 #then
 sudo apt install cockpit
 
 sudo systemctl disable network-manager.service
sudo systemctl stop network-manager.service
