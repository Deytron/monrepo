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

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQxMzI4NjEwOCwxNTU4Mzc3NjhdfQ==
-->