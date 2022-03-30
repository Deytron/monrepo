# TP 1 Setup

On installe l'ESX tranquille sur VMWare Workstation. A la base, pour accéder à l'interface de gestion, le plus simple est d'utiliser une carte en bridge pour avoir une adresse attribuée via DHCP.

On peut pinger l'ESXi :
```bash
PS C:\Users\Romain> ping 192.168.1.23

Envoi d’une requête 'Ping'  192.168.1.23 avec 32 octets de données :
Réponse de 192.168.1.23 : octets=32 temps<1ms TTL=64
Réponse de 192.168.1.23 : octets=32 temps<1ms TTL=64
Réponse de 192.168.1.23 : octets=32 temps<1ms TTL=64
Réponse de 192.168.1.23 : octets=32 temps<1ms TTL=64

Statistiques Ping pour 192.168.1.23:
    Paquets : envoyés = 4, reçus = 4, perdus = 0 (perte 0%),
Durée approximative des boucles en millisecondes :
    Minimum = 0ms, Maximum = 0ms, Moyenne = 0ms
```

Et l'interface ressemble à ça :

![](https://i.imgur.com/xrPr59H.png)

## Stockage

J'ai ajouté le disque de 50 GB et créé `datastore01_local` :

## VM

Bon comment dire que y a vraiment beaucoup de VM là :

![](https://i.imgur.com/pSQ7swQ.png)

Pour lancer une VM automatiquement au démarrage de l'ESXi, il y a une simple case à cocher :

![](https://i.imgur.com/JRNggOL.png)

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
- em2 : NFS1
- em3 : iSCI 1
- em4 : iSCI 2

La configuration de l'agrégat est comme telle :

![](https://i.imgur.com/4L6jwy3.png)

On va en profiter pour créer un pool de stockage ZFS. On sélectionne les 4 disques comme demandés (nommés pour moi da0-4), puis on confirme. Enfin, on créer le Dataset avec les options demandées, puis on met en place le sharing NFS dans la section dédiée, de manière à pouvoir autoriser l'ESXi à communiquer avec le stockage NFS. Puis on active le service en bindant l'IP de l'agrégat.

![](https://i.imgur.com/uSrAQ2q.png)

On crée le user `VMware` en mettant comme point de mount le Dataset, à savoir /`mnt/VMWARE/account`.

## VMWare ESXi

On va créer un vSwitch NFS comme ceci :

![](https://i.imgur.com/ddHkgW9.png)

Ensuite on crée le VMKernel demandé vmk1 :

![](https://i.imgur.com/dn0S6t5.png)

## Pool

Dans l'ESX, on vient créer un point de montage NFS avec ces infos :

![](https://i.imgur.com/kRnsyhj.png)


