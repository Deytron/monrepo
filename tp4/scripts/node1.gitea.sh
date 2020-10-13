sudo yum update -y
sudo yum install wget git nano epel-release mariadb-server -y
sudo useradd git
sudo mkdir -p /etc/gitea /var/lib/gitea/{custom,data,indexers,public,log}
sudo chown git:git /var/lib/gitea/{data,indexers,log}
sudo chmod 750 /var/lib/gitea/{data,indexers,log}
sudo chown root:git /etc/gitea
sudo chmod 770 /etc/gitea
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo wget https://github.com/go-gitea/gitea/releases/download/v1.12.5/gitea-1.12.5-linux-amd64 -O /usr/local/bin/gitea
sudo chmod +x /usr/local/bin/gitea

