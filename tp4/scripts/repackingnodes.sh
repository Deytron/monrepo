yum update
yum install -y vim
setenforce 0
sed -i '/SELINUX=enforcing/c\SELINUX=disabled' /etc/selinux/config

