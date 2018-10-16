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
yum install -y device-mapper-persistent-data > /dev/null 2>&1
yum install -y net-tools > /dev/null 2>&1
yum install -y lvm2 > /dev/null 2>&1

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo -e "-- Installing Docker Service\n"
yum install docker-ce -y

systemctl enable docker.service
systemctl start  docker.service
# END ##########################################################################
echo -e "-- ---------------- --"
echo -e "-- END BOOTSTRAPING --"
echo -e "-- ---------------- --"