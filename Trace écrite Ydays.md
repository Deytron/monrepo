IP des PC :
```
PC1> sh ip  
  
NAME : PC1[1]  
IP/MASK : 192.168.10.2/24  
GATEWAY : 192.168.10.254  
DNS : 192.168.10.10  
DHCP SERVER : 192.168.10.254  
DHCP LEASE : 85481, 86400/43200/75600  
MAC : 00:50:79:66:68:01  
LPORT : 20038  
RHOST:PORT : 127.0.0.1:20039  
MTU: : 1500
```
```
PC2> sh ip  
  
NAME : PC2[1]  
IP/MASK : 192.168.20.2/24  
GATEWAY : 192.168.20.254  
DNS : 192.168.20.1  
DHCP SERVER : 192.168.20.254  
DHCP LEASE : 85765, 86400/43200/75600  
MAC : 00:50:79:66:68:03  
LPORT : 20040  
RHOST:PORT : 127.0.0.1:20041  
MTU: : 1500
```
```
PC3> sh ip  
  
NAME : PC3[1]  
IP/MASK : 192.168.30.2/24  
GATEWAY : 192.168.30.254  
DNS : 192.168.30.1  
DHCP SERVER : 192.168.30.254  
DHCP LEASE : 86382, 86400/43200/75600  
MAC : 00:50:79:66:68:00  
LPORT : 20042  
RHOST:PORT : 127.0.0.1:20043  
MTU: : 1500
```
```
PC4> sh ip  
  
NAME : PC4[1]  
IP/MASK : 192.168.40.2/24  
GATEWAY : 192.168.40.254  
DNS : 192.168.40.1  
DHCP SERVER : 192.168.40.254  
DHCP LEASE : 86112, 86400/43200/75600  
MAC : 00:50:79:66:68:02  
LPORT : 20044  
RHOST:PORT : 127.0.0.1:20045  
MTU: : 1500
```
Config des switchs :
```
IOU1#sh run  
Building configuration...  
  
Current configuration : 1526 bytes  
!  
! Last configuration change at 22:08:23 UTC Tue Apr 14 2020  
!  
version 15.2  
service timestamps debug datetime msec  
service timestamps log datetime msec  
no service password-encryption  
service compress-config  
!  
hostname gns3vm  
!  
boot-start-marker  
boot-end-marker  
!  
!  
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL  
logging buffered 50000  
logging console discriminator EXCESS  
!  
no aaa new-model  
!  
!  
!  
!  
!  
no ip icmp rate-limit unreachable  
!  
!  
!  
no ip domain-lookup  
ip cef  
no ipv6 cef  
!  
!  
!  
spanning-tree mode rapid-pvst  
spanning-tree extend system-id  
!  
vlan internal allocation policy ascending  
!  
ip tcp synwait-time 5  
!  
!  
!  
!  
!  
!  
!  
!  
!  
!  
!  
!  
!  
interface Ethernet0/0  
switchport trunk encapsulation dot1q  
switchport mode trunk  
!  
interface Ethernet0/1  
!  
interface Ethernet0/2  
!  
interface Ethernet0/3  
!  
interface Ethernet1/0  
switchport access vlan 10  
switchport mode access  
!  
interface Ethernet1/1  
!  
interface Ethernet1/2  
!  
interface Ethernet1/3  
!  
interface Ethernet2/0  
switchport access vlan 20  
switchport mode access  
!  
interface Ethernet2/1  
!  
interface Ethernet2/2  
!  
interface Ethernet2/3  
!  
interface Ethernet3/0  
!  
interface Ethernet3/1  
!  
interface Ethernet3/2  
!  
interface Ethernet3/3  
!  
interface Vlan1  
no ip address  
shutdown  
!  
ip forward-protocol nd  
!  
!  
no ip http server  
no ip http secure-server  
!  
!  
!  
!  
!  
control-plane  
!  
!  
line con 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
line aux 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
line vty 0 4  
login  
!  
!  
end
```
```



<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MTQzMjY2ODksMTk5ODE3NTAxMiwtMT
Y0OTU2ODQ0NV19
-->