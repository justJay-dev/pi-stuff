# ssh ubuntu@whatever

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
