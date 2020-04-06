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
Normalement si un guests  prend une IP
<!--stackedit_data:
eyJoaXN0b3J5IjpbNDAyNzMzMTQsLTEwOTcwNDQ2NSwtNDEzMj
g2MTA4LDE1NTgzNzc2OF19
-->