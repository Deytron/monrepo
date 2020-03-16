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
Pour mettre en évidence le routage, j'ai fait un `tcpdump` sur le router. Pour se faire, j'ai utilisé la commande `sudo tcpdump -i enp0s8/enp0s9 -w capture1/2.pcap`. J'ai laissé tourné, ouvert un autre onglet terminal et fait un `ping client1/server1`. 
Puis j'ai arrêté la capture et envoyé le fichier de ma VM à ma machine locale avec 
``sudo scp -r -P 7777 lemalgache@10.3.1.254:/home/lemalgache/capture1/2.pcap /home/lemalgache/Documen
ts``.


| Machine | MAC Source        | MAC Destination   | IP Source | IP Destination |
|---------|-------------------|-------------------|-----------|----------------|
| net1 (rentre dans `router`)   | 0a:00:27:00:00:00 | 08:00:27:29:f4:02 | 10.3.1.1  | 10.3.1.254     |
| net2 (part de `router`)    | 08:00:27:8f:9f:14 | 08:00:27:2b:44:56 | 10.3.2.254 | 10.3.2.11     |

## II. ARP
### 1. Tables ARP
Client 1 `ip n` :
````bash
[lemalgache@client1 ~]$ ip n  
10.3.1.254 dev enp0s8 lladdr 08:00:27:29:f4:02 STALE  
10.3.1.1 dev enp0s8 lladdr 0a:00:27:00:00:00 REACHABLE
````
Server 1 `ip n` :
````bash
[lemalgache@server1 ~]$ ip n  
10.3.2.1 dev enp0s8 lladdr 0a:00:27:00:00:01 DELAY  
10.3.2.254 dev enp0s8 lladdr 08:00:27:2b:44:56 STALE
````
Router `ip n` :
````bash
[lemalgache@router ~]$ ip n  
10.3.1.11 dev enp0s8 lladdr 08:00:27:f7:25:85 STALE  
10.3.1.1 dev enp0s8 lladdr 0a:00:27:00:00:00 DELAY  
10.3.2.11 dev enp0s9 lladdr 08:00:27:8f:9f:14 STALE  
10.3.2.1 dev enp0s9 lladdr 0a:00:27:00:00:01 STALE
````
A chaque fois on a en premier l'IP concernée. Ensuite :

dev = L'interface réseau utilisée (enp0s8/enp0s9)

lladdr = Link Local Address. Indique l'adresse MAC concernée.

STALE indique que la correspondance entre l'adresse MAC et IP est bien établie, mais que l'hôte n'est pas joignable pour le moment. 

REACHABLE indique que la correspondance entre l'adresse MAC et IP est bien établie et l'adresse et joignable.

DELAY indique qu'un paquet a été envoyé à l'adresse et une confirmation de correspondances d'adresse est en attente.


### A. Table ARP 1
On va commencer par vider la table ARP de client1 et router avec la commande `sudo ip -s -s n flush all`. On vérifie que tout a bien été flush et on est bon toi même tu sais :
````bash
[lemalgache@client1 ~]$ sudo ip -s -s n flush all  
[sudo] Mot de passe de lemalgache :  
10.3.1.254 dev enp0s8 lladdr 08:00:27:29:f4:02 used 729/727/692 probes 1 STALE  
10.3.1.1 dev enp0s8 lladdr 0a:00:27:00:00:00 ref 1 used 0/0/2 probes 1 DELAY  
  
*** Round 1, deleting 2 entries ***  
*** Flush is complete after 1 round ***
````
La table ARP de client1 est vide : 
```bash
[lemalgache@client1 ~]$ ip n  
10.3.1.1 dev enp0s8 lladdr 0a:00:27:00:00:00 DELAY
```
On envoie un ping de client1 à server1 et on observer le changement dans la table ARP :
````bash
[lemalgache@client1 ~]$ ip n  
10.3.1.254 dev enp0s8 lladdr 08:00:27:29:f4:02 REACHABLE  
10.3.1.1 dev enp0s8 lladdr 0a:00:27:00:00:00 REACHABLE
````
L'adresse de server1 a bien été ajoutée à la table ARP de client1 et est REACHABLE.

### B. Table ARP 2
On clean les tables de toutes les machines. Je fais ensuite un ping de client1 à server1 et j'observer la table ARP de server 1 :
````bash
[lemalgache@server1 ~]$ ip n  
10.3.2.1 dev enp0s8 lladdr 0a:00:27:00:00:01 DELAY  
10.3.2.254 dev enp0s8 lladdr 08:00:27:2b:44:56 DELAY
````
Les adresses sont revenues dans la liste de table du server.
### `tcpdump` 1
Après avoir fait un dump du client1, on obtient ceci (ouais j'ai fait un screen) :
![](https://i.imgur.com/peFx21V.png)
Aux deux premières lignes jaunes, le client1 (10.3.1.11) demande qui a l'adresse 10.3.1.254 (qui est le router). Le router répond avec son adresse MAC.
Aux deux dernières lignes, c'est l'inverse. Le router demande qui a l'adresse 10.3.1.11, le client répond avec sa MAC.
### `tcpdump` 2
Après avoir flush toutes les tables ARP, je lance un tcpdump sur verser1 pour voir toues les trames de client1.
![](https://i.imgur.com/hthrE2v.png)
Le client demande au router qui a l'adresse 10.3.2.11 (càd le server).
### [](#e-u-okay-bro-)E. u okay bro ?
On va faire un schéma simple.
Donc déjà le schéma il ressemble à ça :

![](https://i.imgur.com/F9h7lP3.png)
Quand le client1 envoie un ping au server1, il passe d'abord par le routeur, et il demande "Wsh frérot bien je dois envoyer un ping à 10.3.2.11 c'est qui' et le router répond "tkt pas frérot 10.3.2.11 c'est {adresse MAC}" et du coup il peut envoyer son ping. Même chose du server au client.
## Entracte : Donner un accès internet aux VMs
J'ai réactivé la carte NAT du router avec `sudo ifup enp0s3`, configuré le tout avec les commandes -   `firewall-cmd --add-masquerade --permanent` et `firewall-cmd --reload`. Ensuite j'ai ajouté une route par défaut pour client1 avec `sudo ip route add default via 10.3.1.254`.

````bash
[lemalgache@client1 ~]$ ip r  
default via 10.3.1.254 dev enp0s8  
10.3.1.0/24 dev enp0s8 proto kernel scope link src 10.3.1.11 metric 101  
10.3.2.0/24 via 10.3.1.254 dev enp0s8 proto static metric 101
````
J'ai ensuite configuré le serveur DNS en ajoutant `1.1.1.1` au fichier `/etc/resolv.conf`, et j'ai testé le fonctionnement avec deux commandes :
````bash
[lemalgache@client1 ~]$ curl gitlab.com --verbose  
* About to connect() to gitlab.com port 80 (#0)  
* Trying 35.231.145.151...  
* Connected to gitlab.com (35.231.145.151) port 80 (#0)  
> GET / HTTP/1.1  
> User-Agent: curl/7.29.0  
> Host: gitlab.com  
> Accept: */*  
>  
< HTTP/1.1 301 Moved Permanently  
< Content-length: 0  
< Location: https://gitlab.com/  
<  
* Connection #0 to host gitlab.com left intact
````
````bash
[lemalgache@client1 ~]$ dig gitlab.com  
  
; <<>> DiG 9.11.4-P2-RedHat-9.11.4-9.P2.el7 <<>> gitlab.com  
;; global options: +cmd  
;; Got answer:  
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 36476  
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1  
  
;; OPT PSEUDOSECTION:  
; EDNS: version: 0, flags:; udp: 1452  
;; QUESTION SECTION:  
;gitlab.com. IN A  
  
;; ANSWER SECTION:  
gitlab.com. 139 IN A 35.231.145.151  
  
;; Query time: 18 msec  
;; SERVER: 1.1.1.1#53(1.1.1.1)  
;; WHEN: lun. mars 16 16:42:00 CET 2020  
;; MSG SIZE rcvd: 55
````
On fait un ping à 8.8.8.8 pour tester le WAN de client1 :
````bash
[lemalgache@client1 ~]$ ping 8.8.8.8  
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.  
64 bytes from 8.8.8.8: icmp_seq=1 ttl=61 time=17.4 ms  
64 bytes from 8.8.8.8: icmp_seq=2 ttl=61 time=18.1 ms  
^C  
--- 8.8.8.8 ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1159ms  
rtt min/avg/max/mdev = 17.460/17.810/18.160/0.350 ms
````
On teste le dig :
````bash
[lemalgache@client1 ~]$ dig pornhub.com  
  
; <<>> DiG 9.11.4-P2-RedHat-9.11.4-9.P2.el7 <<>> pornhub.com  
;; global options: +cmd  
;; Got answer:  
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 41732  
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1  
  
;; OPT PSEUDOSECTION:  
; EDNS: version: 0, flags:; udp: 1452  
;; QUESTION SECTION:  
;pornhub.com. IN A  
  
;; ANSWER SECTION:  
pornhub.com. 3227 IN A 66.254.114.41  
  
;; Query time: 16 msec  
;; SERVER: 1.1.1.1#53(1.1.1.1)  
;; WHEN: lun. mars 16 16:44:51 CET 2020  
;; MSG SIZE rcvd: 56
````
Installer un package via yum fonctionne tout aussi bien :
````bash
[lemalgache@client1 ~]$ sudo yum install -y epel-release  
[sudo] Mot de passe de lemalgache :  
Modules complémentaires chargés : fastestmirror  
Loading mirror speeds from cached hostfile  
* base: centos.mirrors.proxad.net  
* extras: miroir.univ-lorraine.fr  
* updates: centos.mirrors.proxad.net  
base | 3.6 kB 00:00:00  
extras | 2.9 kB 00:00:00  
updates | 2.9 kB 00:00:00  
Résolution des dépendances  
--> Lancement de la transaction de test  
---> Le paquet epel-release.noarch 0:7-11 sera installé  
--> Résolution des dépendances terminée  
  
Dépendances résolues  
  
=======================================================================================================================  
Package Architecture Version Dépôt Taille  
=======================================================================================================================  
Installation :  
epel-release noarch 7-11 extras 15 k  
  
Résumé de la transaction  
=======================================================================================================================  
Installation 1 Paquet  
  
Taille totale des téléchargements : 15 k  
Taille d'installation : 24 k  
Downloading packages:  
epel-release-7-11.noarch.rpm | 15 kB 00:00:00  
Running transaction check  
Running transaction test  
Transaction test succeeded  
Running transaction  
Installation : epel-release-7-11.noarch 1/1  
Vérification : epel-release-7-11.noarch 1/1  
  
Installé :  
epel-release.noarch 0:7-11  
  
Terminé !
````
C'est bon elle est là ta locomotive t'es content
![](https://i.imgur.com/lUvQWAO.png)
## III. Plus de `tcpdump`
On ouvre le port 9999/tcp sur le firewall et on vérifie que netcat fonctionne :
````bash
[lemalgache@client1 ~]$ nc server1 9999  
wsh le sang on est la  
la tema  
bb  
bebou
````
````bash
[lemalgache@server1 ~]$ nc -l 10.3.2.11 9999  
wsh le sang on est la  
la tema  
bb  
bebou
````
### B. Analyse de trames
Le 3-way handshake correspond au SYN SYN-ACK ACK. Il est mis en évidence dans Wireshark :
![](https://i.imgur.com/reIAN0Y.png)

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTkwMjM5ODk5MSw5OTg4OTA4NjAsMTYwMz
AwODExLC0xOTQxMTI2OTAxLDM5NjUzODQzMSwxNTM4NjIyMTEw
LDEyOTA5Mzc0NCw0Njc1NjU1NzAsMTE4MTU3NjU5MSwxNjQxOT
k4OTMxLDc4Mjc2ODY0LC0yMDAzNDIyMzA5LC03NTExNzY3NzEs
LTEwNDU4NzUzMzYsLTU0MTc4NTk2OCwxOTY3MDEwMjE4LDg5MD
IyODQ3NSwyMDgwMDQ5MjcsMTM5NjI1Nzc1NiwxODgxNTM2ODEy
XX0=
-->