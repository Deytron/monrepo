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
IOU2#sh run  
Building configuration...  
  
Current configuration : 1526 bytes  
!  
! Last configuration change at 23:05:56 UTC Tue Apr 14 2020  
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
switchport access vlan 30  
switchport mode access  
!  
interface Ethernet1/1  
!  
interface Ethernet1/2  
!  
interface Ethernet1/3  
!  
interface Ethernet2/0  
switchport access vlan 40  
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
Config des routeurs :
```
R1#sh run  
Building configuration...  
  
Current configuration : 1854 bytes  
!  
version 12.4  
service timestamps debug datetime msec  
service timestamps log datetime msec  
no service password-encryption  
!  
hostname R1  
!  
boot-start-marker  
boot-end-marker  
!  
!  
no aaa new-model  
!  
resource policy  
!  
ip subnet-zero  
no ip icmp rate-limit unreachable  
ip cef  
ip tcp synwait-time 5  
!  
!  
no ip dhcp use vrf connected  
!  
!  
no ip ips deny-action ips-interface  
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
!  
!  
!  
!  
!  
!  
!  
!  
interface FastEthernet0/0  
ip address dhcp  
ip nat outside  
ip virtual-reassembly  
duplex half  
!  
interface FastEthernet1/0  
ip address 192.168.150.1 255.255.255.252  
ip nat inside  
ip virtual-reassembly  
duplex half  
!  
interface FastEthernet2/0  
ip address 192.168.100.2 255.255.255.252  
ip nat inside  
ip virtual-reassembly  
duplex half  
!  
interface FastEthernet3/0  
ip address 192.168.120.253 255.255.255.0  
duplex half  
!  
interface FastEthernet4/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet5/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet6/0  
no ip address  
shutdown  
duplex half  
!  
router ospf 1  
router-id 1.1.1.3  
log-adjacency-changes  
network 192.168.10.0 0.0.0.255 area 0  
network 192.168.20.0 0.0.0.255 area 0  
network 192.168.30.0 0.0.0.255 area 0  
network 192.168.40.0 0.0.0.255 area 0  
network 192.168.50.0 0.0.0.3 area 0  
network 192.168.100.0 0.0.0.3 area 0  
network 192.168.122.0 0.0.0.255 area 0  
network 192.168.150.0 0.0.0.3 area 0  
default-information originate  
!  
ip classless  
no ip http server  
no ip http secure-server  
!  
!  
ip nat inside source list 1 interface FastEthernet0/0 overload  
!  
access-list 1 permit any  
no cdp log mismatch duplex  
!  
!  
!  
!  
control-plane  
!  
!  
!  
!  
!  
!  
gatekeeper  
shutdown  
!  
!  
line con 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
stopbits 1  
line aux 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
stopbits 1  
line vty 0 4  
login  
!  
!  
end
```
```
R2#sh run  
Building configuration...  
  
Current configuration : 2074 bytes  
!  
version 12.4  
service timestamps debug datetime msec  
service timestamps log datetime msec  
no service password-encryption  
!  
hostname R2  
!  
boot-start-marker  
boot-end-marker  
!  
!  
no aaa new-model  
!  
resource policy  
!  
ip subnet-zero  
no ip icmp rate-limit unreachable  
ip cef  
ip tcp synwait-time 5  
!  
!  
no ip dhcp use vrf connected  
!  
ip dhcp pool Vlan10  
network 192.168.10.0 255.255.255.0  
default-router 192.168.10.254  
dns-server 192.168.10.10  
!  
ip dhcp pool Vlan20  
network 192.168.20.0 255.255.255.0  
default-router 192.168.20.254  
dns-server 192.168.20.1  
!  
!  
ip name-server 8.8.8.8  
no ip ips deny-action ips-interface  
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
!  
!  
!  
!  
!  
!  
!  
!  
interface FastEthernet0/0  
no ip address  
duplex half  
!  
interface FastEthernet0/0.10  
encapsulation dot1Q 10  
ip address 192.168.10.254 255.255.255.0  
no snmp trap link-status  
!  
interface FastEthernet0/0.20  
encapsulation dot1Q 20  
ip address 192.168.20.254 255.255.255.0  
no snmp trap link-status  
!  
interface FastEthernet1/0  
ip address 192.168.50.1 255.255.255.252  
duplex half  
!  
interface FastEthernet2/0  
ip address 192.168.150.2 255.255.255.252  
duplex half  
!  
interface FastEthernet3/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet4/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet5/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet6/0  
no ip address  
shutdown  
duplex half  
!  
router ospf 1  
router-id 1.1.1.1  
log-adjacency-changes  
network 192.168.10.0 0.0.0.255 area 0  
network 192.168.20.0 0.0.0.255 area 0  
network 192.168.30.0 0.0.0.255 area 0  
network 192.168.40.0 0.0.0.255 area 0  
network 192.168.50.0 0.0.0.3 area 0  
network 192.168.122.0 0.0.0.255 area 0  
network 192.168.150.0 0.0.0.3 area 0  
!  
ip classless  
no ip http server  
no ip http secure-server  
!  
!  
!  
no cdp log mismatch duplex  
!  
!  
!  
!  
control-plane  
!  
!  
!  
!  
!  
!  
gatekeeper  
shutdown  
!  
!  
line con 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
stopbits 1  
line aux 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
stopbits 1  
line vty 0 4  
login  
!  
!  
end
```
```
R3#sh run  
Building configuration...  
  
Current configuration : 2018 bytes  
!  
version 12.4  
service timestamps debug datetime msec  
service timestamps log datetime msec  
no service password-encryption  
!  
hostname R3  
!  
boot-start-marker  
boot-end-marker  
!  
!  
no aaa new-model  
!  
resource policy  
!  
ip subnet-zero  
no ip icmp rate-limit unreachable  
ip cef  
ip tcp synwait-time 5  
!  
!  
no ip dhcp use vrf connected  
!  
ip dhcp pool Vlan30  
network 192.168.30.0 255.255.255.0  
default-router 192.168.30.254  
dns-server 192.168.30.1  
!  
ip dhcp pool Vlan40  
network 192.168.40.0 255.255.255.0  
default-router 192.168.40.254  
dns-server 192.168.40.1  
!  
!  
ip name-server 8.8.8.8  
no ip ips deny-action ips-interface  
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
!  
!  
!  
!  
!  
!  
!  
!  
interface FastEthernet0/0  
no ip address  
duplex half  
!  
interface FastEthernet0/0.10  
encapsulation dot1Q 30  
ip address 192.168.30.254 255.255.255.0  
no snmp trap link-status  
!  
interface FastEthernet0/0.20  
encapsulation dot1Q 40  
ip address 192.168.40.254 255.255.255.0  
no snmp trap link-status  
!  
interface FastEthernet1/0  
ip address 192.168.50.2 255.255.255.252  
duplex half  
!  
interface FastEthernet2/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet3/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet4/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet5/0  
no ip address  
shutdown  
duplex half  
!  
interface FastEthernet6/0  
no ip address  
shutdown  
duplex half  
!  
router ospf 1  
router-id 1.1.1.2  
log-adjacency-changes  
network 192.168.10.0 0.0.0.255 area 0  
network 192.168.20.0 0.0.0.255 area 0  
network 192.168.30.0 0.0.0.255 area 0  
network 192.168.40.0 0.0.0.255 area 0  
network 192.168.50.0 0.0.0.3 area 0  
network 0.0.0.0 255.255.255.255 area 0  
!  
ip classless  
no ip http server  
no ip http secure-server  
!  
!  
!  
no cdp log mismatch duplex  
!  
!  
!  
!  
control-plane  
!  
!  
!  
!  
!  
!  
gatekeeper  
shutdown  
!  
!  
line con 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
stopbits 1  
line aux 0  
exec-timeout 0 0  
privilege level 15  
logging synchronous  
stopbits 1  
line vty 0 4  
login  
!  
!  
end
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgyMDgxMjc2OCw0MzQzODI3NSwxOTk4MT
c1MDEyLC0xNjQ5NTY4NDQ1XX0=
-->