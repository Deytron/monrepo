sudo yum update -y
sudo yum install wget git nano epel-release -y
sudo yum install nginx -y
sudo wget 

# HOSTS
sudo echo "192.168.56.11  node1.tp4.gitea node1gitea" >> /etc/hosts
sudo echo "192.168.56.12  node2.tp4.bdd node2bdd" >> /etc/hosts
sudo echo "192.168.56.14  node4.tp4.nfs node4nfs" >> /etc/hosts

