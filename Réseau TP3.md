# TP 3 - Routage, ARP, Spéléologie réseau
#### **Prouvez que chacun des points de la préparation de l'environnement ci-dessus ont été respectés** :
**Carte NAT désactivée** :

Client 1 `ip a` :
````bash
[lemalgache@client1 ~]$ ip a  
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000  
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
inet 127.0.0.1/8 scope host lo  
valid_lft forever preferred_lft forever  
inet6 ::1/128 scope host  
valid_lft forever preferred_lft forever  
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:99:62:e6 brd ff:ff:ff:ff:ff:ff  
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:f7:25:85 brd ff:ff:ff:ff:ff:ff  
inet 10.3.1.11/24 brd 10.3.1.255 scope global noprefixroute enp0s8  
valid_lft forever preferred_lft forever  
inet6 fe80::a00:27ff:fef7:2585/64 scope link noprefixroute  
valid_lft forever preferred_lft forever
````
Server 1 `ip a` :
````bash
[lemalgache@server1 ~]$ ip a  
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000  
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
inet 127.0.0.1/8 scope host lo  
valid_lft forever preferred_lft forever  
inet6 ::1/128 scope host  
valid_lft forever preferred_lft forever  
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:b1:01:5e brd ff:ff:ff:ff:ff:ff  
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:8f:9f:14 brd ff:ff:ff:ff:ff:ff  
inet 10.3.2.11/24 brd 10.3.2.255 scope global noprefixroute enp0s8  
valid_lft forever preferred_lft forever  
inet6 fe80::a00:27ff:fe8f:9f14/64 scope link noprefixroute  
valid_lft forever preferred_lft forever
````
Router `ip a` :
````bash
[lemalgache@router ~]$ ip a  
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000  
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
inet 127.0.0.1/8 scope host lo  
valid_lft forever preferred_lft forever  
inet6 ::1/128 scope host  
valid_lft forever preferred_lft forever  
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:7c:12:d6 brd ff:ff:ff:ff:ff:ff  
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:29:f4:02 brd ff:ff:ff:ff:ff:ff  
inet 10.3.1.254/24 brd 10.3.1.255 scope global noprefixroute enp0s8  
valid_lft forever preferred_lft forever  
inet6 fe80::a00:27ff:fe29:f402/64 scope link noprefixroute  
valid_lft forever preferred_lft forever  
4: enp0s9: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000  
link/ether 08:00:27:2b:44:56 brd ff:ff:ff:ff:ff:ff  
inet 10.3.2.254/24 brd 10.3.2.255 scope global noprefixroute enp0s9  
valid_lft forever preferred_lft forever  
inet6 fe80::a00:27ff:fe2b:4456/64 scope link noprefixroute  
valid_lft forever preferred_lft forever
````

**Serveur SSH fonctionnel qui écoute sur le port `7777/tcp`**

Client 1 `ss -ltn` :
````bash
[lemalgache@client1 ~]$ ss -ltn  
State Recv-Q Send-Q Local Address:Port Peer Address:Port  
LISTEN 0 100 127.0.0.1:25 *:*  
LISTEN 0 128 *:7777 *:*  
LISTEN 0 100 [::1]:25 [::]:*  
LISTEN 0 128 [::]:7777 [::]:*
````

Server 1 `ss -ltn` :
````bash
[lemalgache@server1 ~]$ ss -ltn  
State Recv-Q Send-Q Local Address:Port Peer Address:Port  
LISTEN 0 100 127.0.0.1:25 *:*  
LISTEN 0 128 *:7777 *:*  
LISTEN 0 100 [::1]:25 [::]:*  
LISTEN 0 128 [::]:7777 [::]:*
````
Router `ss -ltn` :
````bash
[lemalgache@router ~]$ ss -ltn  
State Recv-Q Send-Q Local Address:Port Peer Address:Port  
LISTEN 0 100 127.0.0.1:25 *:*  
LISTEN 0 128 *:7777 *:*  
LISTEN 0 100 [::1]:25 [::]:*  
LISTEN 0 128 [::]:7777 [::]:*
````
**Pare-feu activé et configuré**

Client 1 `firewalld-cmd` :
````bash
[lemalgache@client1 ~]$ sudo firewall-cmd --list-ports  
[sudo] Mot de passe de lemalgache :  
7777/tcp
````
Server 1 `firewalld-cmd` :
````bash
[lemalgache@server1 ~]$ sudo firewall-cmd --list-ports  
[sudo] Mot de passe de lemalgache :  
7777/tcp
````
Router `firewalld-cmd` :
````bash
[lemalgache@router ~]$ sudo firewall-cmd --list-ports  
[sudo] Mot de passe de lemalgache :  
7777/tcp
````
**Nom configuré**

Client 1 `hostname` :
````bash
[lemalgache@client1 ~]$ hostname  
client1.net1.tp3
````
Server 1 `hostname` :
````bash
[lemalgache@server1 ~]$ hostname  
server1.net2.tp3
````
Router `hostname` :
````bash
[lemalgache@router ~]$ hostname  
router.tp3
````
**Fichiers `/etc/hosts` de toutes les machines configurés**

Fichier hosts sur chaque machine :
````bash
[lemalgache@client1 ~]$ cat /etc/hosts  
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4  
::1 localhost localhost.localdomain localhost6 localhost6.localdomain6  
10.3.1.11 client1 client1.net1.tp3  
10.3.2.11 server1 server1.net2.tp3  
10.3.1.254 router router.tp3
````
**Réseaux et adressage des machines**

Client 1 vers router :
````bash
[lemalgache@client1 ~]$ ping router  
PING router (10.3.1.254) 56(84) bytes of data.  
64 bytes from router (10.3.1.254): icmp_seq=1 ttl=64 time=1.15 ms  
64 bytes from router (10.3.1.254): icmp_seq=2 ttl=64 time=1.15 ms  
^C  
--- router ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1001ms  
rtt min/avg/max/mdev = 1.152/1.154/1.156/0.002 ms
````
Router vers Client 1 :
````bash
[lemalgache@router ~]$ ping client1  
PING client1 (10.3.1.11) 56(84) bytes of data.  
64 bytes from client1 (10.3.1.11): icmp_seq=1 ttl=64 time=0.924 ms  
64 bytes from client1 (10.3.1.11): icmp_seq=2 ttl=64 time=1.36 ms  
^C  
--- client1 ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1001ms  
rtt min/avg/max/mdev = 0.924/1.144/1.364/0.220 ms
````
Server 1 vers Router :
````bash
[lemalgache@server1 ~]$ ping router  
PING router (10.3.2.254) 56(84) bytes of data.  
64 bytes from router (10.3.2.254): icmp_seq=1 ttl=64 time=1.69 ms  
64 bytes from router (10.3.2.254): icmp_seq=2 ttl=64 time=1.85 ms  
^C  
--- router ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1001ms  
rtt min/avg/max/mdev = 1.699/1.779/1.859/0.080 ms
````
Router vers Server 1 :
````bash
[lemalgache@router ~]$ ping server1  
PING server1 (10.3.2.11) 56(84) bytes of data.  
64 bytes from server1 (10.3.2.11): icmp_seq=1 ttl=64 time=1.10 ms  
^C  
--- server1 ping statistics ---  
1 packets transmitted, 1 received, 0% packet loss, time 0ms  
rtt min/avg/max/mdev = 1.108/1.108/1.108/0.000 ms
````
## I. Mise en place du routage
J'ai mis en place le routage pour que le client puisse pinger le server et inversement. Pour ça, j'ai créé un fichier `route-enp0s8` dans /etc/sysconfig/network-scripts dans le client et le serveur.

`route-enp0s8` dans le client :
````bash
10.3.2.0/24 via 10.3.1.254 dev enp0s8
````
`route-enp0s8` dans le server :
````bash
sudo ip route add 10.3.2.0/24 via 10.3.1.254
````
Aussi, j'effectue sur le router la commande `sudo sysctl -w net.ipv4.conf.all.forwarding=1` pour autoriser la machine à router des paquets.

On vérifie maintenant que le routage fonctionne.
`ip r s` sur client1 :
````bash
[lemalgache@client1 ~]$ ip r s  
10.3.1.0/24 dev enp0s8 proto kernel scope link src 10.3.1.11 metric 101  
10.3.2.0/24 via 10.3.1.254 dev enp0s8 proto static metric 101
````
`ip r s` sur server1 :
````bash
[lemalgache@server1 ~]$ ip r s  
10.3.1.0/24 via 10.3.2.254 dev enp0s8  
10.3.2.0/24 dev enp0s8 proto kernel scope link src 10.3.2.11 metric 101
````
Ping de client1 à server1 :
````bash
[lemalgache@client1 ~]$ ping server1  
PING server1 (10.3.2.11) 56(84) bytes of data.  
64 bytes from server1 (10.3.2.11): icmp_seq=1 ttl=63 time=2.95 ms  
64 bytes from server1 (10.3.2.11): icmp_seq=2 ttl=63 time=2.69 ms  
^C  
--- server1 ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1027ms  
rtt min/avg/max/mdev = 2.698/2.828/2.959/0.140 ms
````
Ping de server1 à client1 :
````bash
[lemalgache@server1 ~]$ ping client1  
PING client1 (10.3.1.11) 56(84) bytes of data.  
64 bytes from client1 (10.3.1.11): icmp_seq=1 ttl=63 time=2.32 ms  
64 bytes from client1 (10.3.1.11): icmp_seq=2 ttl=63 time=2.48 ms  
^C  
--- client1 ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1002ms  
rtt min/avg/max/mdev = 2.326/2.405/2.485/0.093 ms
````
Vérification via `traceroute` sur le router :
````bash
[lemalgache@client1 ~]$ traceroute server1  
traceroute to server1 (10.3.2.11), 30 hops max, 60 byte packets  
1 router (10.3.1.254) 1.447 ms 1.281 ms 1.116 ms  
2 router (10.3.1.254) 0.975 ms !X 0.839 ms !X 0.713 ms !X
````
## 3. Comprendre le routage

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTIwNzU1ODEyNiw0MzEyNTY2ODAsLTY5Nj
gzNzA1Niw1Mjc5MzA3NzksLTE0OTIxMDIwODUsMTM1MTMxMjk2
LDQwMDU2MjE5MiwxMzY1OTk3NTMwLC0xMzA3OTQwMzQ1LDIxMz
ExMDM1NCwzNjYxNTQ0MDUsMTY0NzQyNTA3OSwxODk0OTMzMTAs
MTIyNjU0NjA2MiwtODEyMzU3MDMxLDI0NzIzNDAwLC0xNDMxNz
I5NDI1LC0xNjMwNjU2MjddfQ==
-->