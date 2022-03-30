# TP2 Virtualisation

## Préparation

Comme demandé dans le TP, j'ai créé des cartes réseau Host-Only pour les machines. Voici les réseaux :
- NAT : 192.168.172.0
- NFS1 : 192.168.137.0
- NFS2 : 192.168.239.0
- iSCI 1 : 192.168.139.0
- iSCI 2 : 192.168.45.0

![](https://i.imgur.com/MoIlV5Y.png)

J'ai créé deux VM, un VMWare ESX et un TrueNas. Les configurations sont comme énoncées dans le TP.

## TrueNAS

Les interfaces de TrueNAS correspondent chacunes à un réseau :
- em0 : NAT
- em1 : NFS1
- em2 : iSCI 1
- em3 : iSCI 2

La configuration de l'agrégat est comme telle :

![](https://i.imgur.com/4L6jwy3.png)

## VMWare ESXi

On va créer un vSwitch NFS comme ceci :

![](https://i.imgur.com/ddHkgW9.png)

Ensuite on crée le VMKernel demandé vmk1 :

![](https://i.imgur.com/dn0S6t5.png)