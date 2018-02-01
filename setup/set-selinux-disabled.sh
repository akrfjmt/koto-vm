#!/bin/sh
setenforce 0
sed -i".bak" 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
