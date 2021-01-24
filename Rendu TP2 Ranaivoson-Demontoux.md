# Notes de Projet n°2 : Make Hypervisor Great Again !

### But du projet

Mettre en place une infrastructure de virtualisation avec redondance de stockage, comme ça si un stockage lâche, le second prend le relais avec toutes les données et un backup.

Mettre tout cela en place avec un hyperviseur et un NAS.

### Préparation

A la base, on nous avait dit que pour réaliser le projet et bien gérer le stockage, comme énoncé dans le setup, il nous faudrait : 

- 1 x VM Stockage (Windows Server/OpenFiler/FreeNAS)
- 1 x VM vSphere Hypervisor 7.0
- 1 x VM Routeur (pfSense, VyOS, etc)
- 1 x Réseau NAT
- 2 x Réseau interne
- 1 x Host-Only

On a donc commencé par setup VMWare Workstation 16 et mis une clé de license parfaitement achetée, puis on a commencé par setup une VM pfSense et une VM FreeNas en plus d'un VM CentOS standard pour créer des fichiers à stocker dans le réseau.

VMWare Workstation sera utilisé tout le long de la préparation de l'infrastructure, car c'est l'hyperviseur le plus supporté par les programmes que nous souhaitons utiliser.

![](https://i.imgur.com/9GtgLKd.png)


VMWare ESXi est un hyperviseur bare-metal utilisant son propre kernel qui permet de gérer des machines virtuelles. De notre côté, il va nous permettre de partager notre stockage réseau. Associé à la VM OpenFiler, le stockage pourra être géré via l'hyperviseur.
![](https://i.imgur.com/rpWWKHv.png)

OpenFiler est un système d'exploitation permettant de créer un serveur de stockage en réseau. Lié à la VM CentOS, il pourra stocker et répliquer toutes ses données en synchrone ou asynchrone.

Nous avions au départ pensé à utiliser pfSense. Tout se passait bien, pfSense marchait, de même pour la VM CentOS et nous étions en train de monter la VM FreeNAS, en la paramétrant pour utiliser les services NFS et iSCi. Mais suite à des tests de la part de Jonathan, il a vu que ce setup ne fonctionnerait pas, et nous sommes donc partis sur autre chose, avec cette fois-ci l'utilisation d'un hyperviseur bare metal, à savoir ESXi, et OpenFiler pour le NAS.
![](https://i.imgur.com/8Odr67S.png)

On a installé VMWare ESXi, puis commencé à paramétrer le stockage en suivant ce tutoriel : https://www.vmwarebits.com/content/install-and-configure-openfiler-esxi-shared-storage-nfs-and-iscsi

On a installé OpenFiler sur la VM et une fois installé, accédé à l'interface web avec le user de base. Une fois sur l'interface, on a commencé à paramétrer à partir de quelle adresse ESXi pourra accéder au stockage OpenFiler, créé un volume pour le serveur NFS utilisable sur la VM CentOS et créé une target iSCi pour ESXi, seulement problème, impossible de continuer la configuration et valider la target.

Puis Jonathan est venu avec un nouveau programme tout-en-un, à savoir Starwind Virtual SAN qui permet de configurer un SAN en combinant l'hyperviseur et le serveur de stockage sur une seule machine. Donc on est parti sur ça.
![](https://i.imgur.com/bi0HEZZ.png)

Starwind nous permet d'avoir toutes les fonctionnalités d'un SAN et d'un hyperviseur sur un seul logiciel et une seule machine avec tout ce qu'il faut, réplication, Heartbeat, disques RAId etc.

Pour configurer Starwind, il nous fallait Windows Server. Oui, on ne peut pas l'utiliser sur un Windows standard ou Pro. Donc on est parti télécharger l'ISO Windows Server 2019 et on l'a installé sur une VM à côté de notre VM CentOS. Outre le fait que ça a été long, l'installation de Windows a bien marché et de même pour l'installation de Starwind. Nous avons commencé le setup, 



