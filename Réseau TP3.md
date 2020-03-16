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

Fichier hosts de tous les clients :
````bash
[lemalgache@client1 ~]$ cat /etc/hosts  
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4  
::1 localhost localhost.localdomain localhost6 localhost6.localdomain6  
10.3.1.11 client1 client1.net1.tp3  
10.3.2.11 server1 server1.net2.tp3  
10.3.1.254 router router.tp3
````

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyNzQ0NTk3NDcsLTEzMDc5NDAzNDUsMj
EzMTEwMzU0LDM2NjE1NDQwNSwxNjQ3NDI1MDc5LDE4OTQ5MzMx
MCwxMjI2NTQ2MDYyLC04MTIzNTcwMzEsMjQ3MjM0MDAsLTE0Mz
E3Mjk0MjUsLTE2MzA2NTYyN119
-->