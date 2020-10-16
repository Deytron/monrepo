sudo yum update -y
sudo yum install wget git nano mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb

# HOSTS
sudo echo "192.168.56.12  node2.tp4.bdd node2bdd" >> /etc/hosts
sudo echo "192.168.56.13  node3.tp4.nginx node3nginx" >> /etc/hosts
sudo echo "192.168.56.14  node4.tp4.nfs node4nfs" >> /etc/hosts
