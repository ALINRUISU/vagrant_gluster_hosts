#!/usr/bin/env bash
 
# BEGIN ########################################################################
echo -e "-- ------------------ --\n"
echo -e "-- BEGIN BOOTSTRAPING --\n"
echo -e "-- ------------------ --\n"
 
# VARIABLES ####################################################################    
 
# BOX ##########################################################################
echo -e "-- Updating packages list\n"
yum update -y
 
# Docker #########################################################################
echo -e "-- Installing additional packages\n"
yum install -y yum-utils > /dev/null 2>&1
yum install -y centos-release-gluster > /dev/null 2>&1
yum install -y net-tools > /dev/null 2>&1
yum install -y glusterfs-server > /dev/null 2>&1
yum install -y corosync pacemaker pcs  > /dev/null 2>&1

echo -e "-- Start Services"
systemctl enable glusterd.service
systemctl start  glusterd.service
systemctl enable pcsd.service
systemctl start pcsd.service
systemctl enable corosync.service
systemctl enable pacemaker.service


echo -e "-- Update storage size"
mkdir -p /srv/sdb1 
parted /dev/sdb --script -- mklabel gpt mkpart primary 0% 100%
mkfs.xfs /dev/sdb1 -f
echo "/dev/sdb1 /srv/sdb1 xfs defaults 0 0"  >> /etc/fstab
mkdir -p /srv/sdb1/brick


iptables -A INPUT -p tcp -s 192.168.0.111 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.0.112 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.0.113 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT



# END ##########################################################################
echo -e "-- ---------------- --"
echo -e "-- END BOOTSTRAPING --"
echo -e "-- ---------------- --"