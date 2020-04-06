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
R1(config-subif)#ip address 10.5.10.254 255.255.255.0
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTI0MzAwODc2OSw3ODE5NjEzNDYsLTUwMz
U1NTY4NywtMTQyODk3MDExOCw0NzQ1MzgzNjQsLTUxNTQxODUy
LC0xMDk3MDQ0NjUsLTQxMzI4NjEwOCwxNTU4Mzc3NjhdfQ==
-->