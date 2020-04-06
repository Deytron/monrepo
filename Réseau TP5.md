# TP 5 - Une "vraie" topologie ?
## I. Toplogie 1 - intro VLAN
### 2. Setup clients
Voilà tous les ping.

`admins` :
```bash
PC1> ping 10.5.10.12  
84 bytes from 10.5.10.12 icmp_seq=1 ttl=64 time=0.807 ms  
84 bytes from 10.5.10.12 icmp_seq=2 ttl=64 time=1.441 ms
```
`guests` :
```bash
PC3> ping 10.5.20.12  
84 bytes from 10.5.20.12 icmp_seq=1 ttl=64 time=0.621 ms  
84 bytes from 10.5.20.12 icmp_seq=2 ttl=64 time=1.325 ms
```

### 3. Setup VLANs
On setup les 2 vlan sur les routeurs `IOU L2`:
```bash
gns3vm#conf t  
Enter configuration commands, one per line. End with CNTL/Z.  
gns3vm(config)#vlan 10  
gns3vm(config-vlan)#name admins  
```
```bash
gns3vm#conf t  
Enter configuration commands, one per line. End with CNTL/Z.  
gns3vm(config)#vlan 20  
gns3vm(config-vlan)#name guests
```
Maintenant faut setup les VLAN sur les interfaces des PC admins et guest (chez moi 0/1 et 0/2) et le trunk sur le port inter-switch (chez moi 0/0)

Ici sur le switch IOU1 :
```bash
gns3vm(config)#interface Ethernet 0/1
gns3vm(config-if)#switchport mode access
gns3vm(config-if)#switchport access vlan 10
gns3vm(config-if)#exit
gns3vm(config)#interface Ethernet 0/2
gns3vm(config-if)#switchport mode access 
gns3vm(config-if)#switchport access vlan 10
gns3vm(config-if)#exit
gns3vm(config)#interface Ethernet 0/0
gns3vm(config-if)#switchport mode access
gns3vm(config-if)#switchport trunk encapsulation dot1q 
gns3vm(config-if)#switchport mode trunk 
```
```bash
gns3vm(config)#interface Ethernet 0/1
gns3vm(config-if)#switchport mode access
gns3vm(config-if)#switchport access vlan 20
gns3vm(config-if)#exit
gns3vm(config)#interface Ethernet 0/2
gns3vm(config-if)#switchport mode access 
gns3vm(config-if)#switchport access vlan 20
gns3vm(config-if)#exit
gns3vm(config)#interface Ethernet 0/0
gns3vm(config-if)#switchport mode access
gns3vm(config-if)#switchport trunk encapsulation dot1q 
gns3vm(config-if)#switchport mode trunk 
```
On va test si ça marche en pingant les machines dans `admins` et `guests` :
```bash
PC1> ping 10.5.10.12  
84 bytes from 10.5.10.12 icmp_seq=1 ttl=64 time=1.016 ms  
84 bytes from 10.5.10.12 icmp_seq=2 ttl=64 time=1.214 ms
```
```bash
PC3> ping 10.5.20.12
84 bytes from 10.5.20.12 icmp_seq=1 ttl=64 time=1.242 ms
```
Normalement si un guests  prend une IP dans le réseau en `admins`, par exemple `10.5.10.13`, ça marche pas :
`PC3` :
```bash
PC3> ip 10.5.10.13  
Checking for duplicate address...  
PC1 : 10.5.10.13 255.255.255.0
```
```bash
PC1> ping 10.5.10.13
host (10.5.10.13) not reachable
```
## II. Topologie 2 - VLAN, sous-interface, NAT
### 1. Mise en place de la topologie
On fait la topo on est là :
![](https://i.imgur.com/vmJ9YlA.png)

On configure toutes les IP des machines `admins` et `guests` :
```bash
PC1> ping 10.5.10.12
84 bytes from 10.5.10.12 icmp_seq=1 ttl=64 time=1.334 ms
84 bytes from 10.5.10.12 icmp_seq=2 ttl=64 time=0.999 ms
```
```bash
PC3> ping 10.5.10.13
84 bytes from 10.5.10.13 icmp_seq=1 ttl=64 time=1.030 ms
84 bytes from 10.5.10.13 icmp_seq=2 ttl=64 time=1.134 ms
```
```bash
PC2> ping 10.5.20.12
84 bytes from 10.5.20.12 icmp_seq=1 ttl=64 time=1.302 ms
84 bytes from 10.5.20.12 icmp_seq=2 ttl=64 time=1.172 ms
```
```bash
PC4> ping 10.5.20.13
84 bytes from 10.5.20.13 icmp_seq=1 ttl=64 time=1.047 ms
84 bytes from 10.5.20.13 icmp_seq=2 ttl=64 time=2.621 ms
```
Tout pinge.

Maintenant on met les VLAN partout sur les 3 switch (c'est les mêmes commandes on va assumer que je les ai refait tk)

Je mets l'adresse IP `10.5.10.14` au PC6, il pinge rien :
```bash
PC6> ping 10.5.10.11  
^Chost (10.5.10.11) not reachable  
  
PC6> ping 10.5.10.12  
host (10.5.10.12) not reachable  
  
PC6> ping 10.5.20.12  
No gateway found  
  
PC6> ping 10.5.20.13  
No gateway found
```
Bon maintenant on config le routeur. Il faut ajouter les 2 adresses IP en sous-réseau, donc simple, on suit le tuto :
```bash
R1(config)#interface fastEthernet 0/0.10
R1(config-subif)#encapsulation dot1Q 10
R1(config-subif)#ip address 10.5.10.254 255.255.255.0
R1(config-subif)#exit
R1(config)#interface fastEthernet 0/0
R1(config)#no shut
R1(config-subif)#exit
R1(config)#interface fastEthernet 0/0.20
R1(config-subif)#encapsulation dot1Q 20
R1(config-subif)#ip address 10.5.20.254 255.255.255.0
```
Sur le switch du mileu `IOU2` :
```bash
gns3vm(config)#interface Ethernet 1/0
gns3vm(config-if)#switchport mode trunk 
gns3vm(config-if)#switchport trunk encapsulation dot1q
gns3vm(config-if)#switchport trunk allowed vlan 10,20
```
On ping les passerelles des deux réseaux respectifs :
```bash
PC1> ping 10.5.10.254
84 bytes from 10.5.10.254 icmp_seq=1 ttl=255 time=9.928 ms
84 bytes from 10.5.10.254 icmp_seq=2 ttl=255 time=11.603 ms
```
```bash
PC2> ping 10.5.20.254
84 bytes from 10.5.20.254 icmp_seq=1 ttl=255 time=9.862 ms
84 bytes from 10.5.20.254 icmp_seq=2 ttl=255 time=5.578 ms
```
Ca fonctionne t'as capté.

### 5. NAT
On configure la NAT c'est parti procédure standard
```bash
R1(config)#interface fastEthernet 0/0.10
R1(config-if)#ip nat inside
R1(config-if)#exit
R1(config)#interface fastEthernet 0/0.20
R1(config-if)#ip nat inside
R1(config)#interface fastEthernet 0/1
R1(config-if)#ip nat outside
R1(config-if)#exit
R1(config)#access-list 1 permit any
R1(config)#ip nat inside source list 1 interface fastEthernet 0/1 overload
```
On teste un ping vers google, et boum

```bash
PC1> ping 8.8.8.8  
*10.5.10.254 icmp_seq=1 ttl=255 time=54.009 ms (ICMP type:3, code:1, Destination host unreachable)  
*10.5.10.254 icmp_seq=2 ttl=255 time=3.532 ms (ICMP type:3, code:1, Destination host unreachable)  
*10.5.10.254 icmp_seq=3 ttl=255 time=12.028 ms (ICMP type:3, code:1, Destination host unreachable)
```
```bash
PC2> ping 8.8.8.8  
*10.5.20.254 icmp_seq=1 ttl=255 time=9.092 ms (ICMP type:3, code:1, Destination host unreachable)  
*10.5.20.254 icmp_seq=2 ttl=255 time=8.458 ms (ICMP type:3, code:1, Destination host unreachable)
```
## [](#3-serveur-dhcp)3. Serveur DHCP
Tout le monde peut ping tout le monde.
`PC1` vers `DNS` :
```bash
PC1> ping 10.5.30.11  
84 bytes from 10.5.30.11 icmp_seq=1 ttl=63 time=21.563 ms  
84 bytes from 10.5.30.11 icmp_seq=2 ttl=63 time=16.160 ms
```
DHCP vers `Web` :
![](https://i.imgur.com/aIGCKLg.png)
Là c'est juste deux exemples.
Bon on va reconfig le DHCP. On reprend la machine utilisée dans le TP4 et on change le subnet et les range des IP :
![](https://i.imgur.com/Lr6aeWm.png)
On fait un p'ti `systemctl restart dhcpd` et c'est bon.
Normalement le `guest3` est censé chopper une IP si je lui fait `ip dhcp` :
```bash
PC6> ip dhcp  
DDORA IP 10.5.20.100/24 GW 10.5.20.254
```
### 4. Serveur Web
On télécharge le paquet `epel-release` avec `sudo yum install epel-release` et `nginx`.
Une fois ceci fait, qui dit serveur web dit port HTTP, donc on va autoriser le port 80 sur la machine via la commande `sudo firewall-cmd --add-port=80/tcp --permanent` et `sudo firewall-cmd --reload`. Enfin, on tape un petit `systemctl start nginx` et boum le serveur est lancé. Mais est-ce que ça marche ? Bah on va test.
Deux trucs pour tester le fonctionnement : un petit curl sur le serveur lui-même nous renvoie ça :
![](https://i.imgur.com/NYjsGk0.png)
puis un curl via par exemple le DHCP nous renvoie ça :
![](https://i.imgur.com/PVtBmz9.png)
Bon OK là c'est la sauce, les autres machines captent le serveur nginx mais ne renvoient rien.

### DHCP snooping
Bon bah ça c'est très simple. Pour activer le DHCP Snooping sur un routeur Cisco, on fait `conf t`, `ip dhcp snooping`
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0MjUyNDMxMDcsMTE0MzAwNjE4NiwtOD
Y2MTMzODQxLC0xMjQ4MDI4ODA5LC0xMjM1NjcxMzA3LC0xOTIx
MjYzNjE4LDc0MDA3NjI2MywtMTI0MTA0NjY0MCwtMTYxODcxNj
I5NiwtMTY1MDcxNTc5MiwxMjMwNDYyMTY5LDE3OTYzNDA3MzUs
MTg5NDcyMzA4OSwtNjk0MTE3Mzk1LC0yMTU4MTgxNDIsNjgyND
QzOTYzLDExNTg4NTU2NzcsLTIwODIzNzc1MDQsMTI0MzAwODc2
OSw3ODE5NjEzNDZdfQ==
-->