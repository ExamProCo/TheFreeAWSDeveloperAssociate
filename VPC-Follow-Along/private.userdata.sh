#!/usr/bin/env bash
su ec2-user
echo -e "randompassword\nrandompassword" | passwd ec2-user
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
