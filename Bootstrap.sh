#!/usr/bin/env bash
 
# BEGIN ########################################################################
echo -e "-- ------------------ --\n"
echo -e "-- BEGIN BOOTSTRAPING --\n"
echo -e "-- ------------------ --\n"
 
# VARIABLES ####################################################################    
 
# BOX ##########################################################################
echo -e "-- Updating packages list\n"
Yum update -y
 
# Docker #########################################################################
echo -e "-- Installing additional packages\n"
yum install -y yum-utils > /dev/null 2>&1
yum install -y centos-release-gluster > /dev/null 2>&1
yum install -y net-tools > /dev/null 2>&1
yum install -y glusterfs-server > /dev/null 2>&1
yum install -y corosync pacemaker pcs  > /dev/null 2>&1


systemctl enable glusterd.service
systemctl start  glusterd.service
systemctl enable pcsd.service
systemctl start pcsd.service
systemctl enable corosync.service
systemctl enable pacemaker.service

iptables -A INPUT -p tcp -s 192.168.0.111 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.0.112 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.0.113 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# END ##########################################################################
echo -e "-- ---------------- --"
echo -e "-- END BOOTSTRAPING --"
echo -e "-- ---------------- --"