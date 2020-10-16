sudo yum update -y
sudo yum install wget git nano epel-release nfs-utils -y
systemctl enable nfs-server rpcbind
systemctl start nfs-server rpcbind
sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-service=nfs
sudo firewall-cmd --permanent --add-port=2049/tcp
sudo firewall-cmd --reload
sed -i '/#Domain = local.domain.edu/c\Domain = node4.tp4.nfs' /etc/idmapd.conf
mkdir /nfs
chmod 777 /nfs

# NFS
echo -e "
/nfs   192.168.56.11(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
/nfs   192.168.56.12(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
/nfs   192.168.56.13(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
" > /etc/exports
exportfs -r

# HOSTS
sudo echo "192.168.56.11  node1.tp4.gitea node1gitea" >> /etc/hosts
sudo echo "192.168.56.12  node2.tp4.bdd node2bdd" >> /etc/hosts
sudo echo "192.168.56.13  node3.tp4.nginx node3nginx" >> /etc/hosts
