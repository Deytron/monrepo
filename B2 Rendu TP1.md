# TP1 : Déploiement classique

## Prérequis

Ah on est là on va setup des machines CentOS classiques, on va partitionner tout ça. J'ai rajouté un second disque, sur ce disque j'ai formaté de cette manière : 
```
lvdisplay
  --- Logical volume ---
  LV Path                /dev/srv/data1
  LV Name                data1
  VG Name                srv
  LV UUID                JmUYZU-9yKQ-VHDH-VJzY-h5SK-GX1x-BzRbSz
  LV Write Access        read/write
  LV Creation host, time node1.tp1.b2, 2020-09-23 12:08:16 +0200
  LV Status              available
  # open                 0
  LV Size                2,00 GiB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2
   
  --- Logical volume ---
  LV Path                /dev/srv/data2
  LV Name                data2
  VG Name                srv
  LV UUID                ydG6Kj-es9Y-1bzl-gQ1w-e2zZ-QCbg-X6zlQ8
  LV Write Access        read/write
  LV Creation host, time node1.tp1.b2, 2020-09-23 12:08:21 +0200
  LV Status              available
  # open                 0
  LV Size                3,00 GiB
  Current LE             768
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  ```

Si les partitions doivent être montées automatiquement au démarrage, ça veut dire qu'on doit modifier le fstab. Donc let's go, on modifie `/etc/fstab` : 

```
# /etc/fstab
# Created by anaconda on Sun Mar 22 16:34:33 2020
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos-root /                       xfs     defaults        0 0
UUID=de83f252-79f8-4cf2-b34d-1db8df45b8a3 /boot                   xfs     defaults        0 0
/dev/mapper/centos-swap swap                    swap    defaults        0 0
/dev/srv/data1 /mnt/data1 ext4 defaults 0 0
/dev/srv/data2 /mnt/data2 ext4 defaults 0 0
```

J'ai dû également faire la commande `mkfs.ext4 /dev/srv/data1` pour créer un système de fichier sur les partitions, autrement le système plantait au chargement du fstab, puisqu'il ne trouve rien à monter comme système de fichier.

Nos machines virtuelles ont bien une carte réseau dédiée avec pour adresse 192.168.1.11 et 192.168.1.12, avec les hostname nodeX.tp1.b2.

Dans les fichiers hosts sont présents les adresses des deux machines :
```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.1.11 node1.tp1.b2
```

Bang les deux machines peuvent se ping : 

```
[lemalgache@node1 /]$ ping node2.tp1.b2
PING node2.tp1.b2 (192.168.1.12) 56(84) bytes of data.
64 bytes from node2.tp1.b2 (192.168.1.12): icmp_seq=1 ttl=64 time=2.59 ms
64 bytes from node2.tp1.b2 (192.168.1.12): icmp_seq=2 ttl=64 time=1.40 ms
64 bytes from node2.tp1.b2 (192.168.1.12): icmp_seq=3 ttl=64 time=1.21 ms
```

Pour faire en sorte que le firewall bloque toutes les connexions entrantes et sortantes, il faut définir la zone du firewall par défaut comme étant la zone "bloquée". C'est pas la seule manière de le faire mais c'est radical. On utilise cette commande : 
``sudo firewall-cmd --set-default-zone block``

Bien évidemment, si on bloque tout, on bloque aussi le SSH. Donc il faut rajouter le port SSH dans la liste des ports autorisés à communiquer : 
`firewall-cmd --zone=public --add-port=22/tcp --permanent`

Il faut aussi rajouter les 2 PC dans la liste des postes qui peuvent communiquer. Pour cela, on peut les rajouter mutuellement dans les zones "trusted" des firewall avec la commande `firewall-cmd --permanent --zone=trusted --add-source=192.168.1.1X`. A partir de là, toutes les connexions sont bloquées et seul le SSH et l'autre PC sont autoriés à fonctionner.

Puis on reload le firewall. 
Avec cette commande, toutes les interfaces réseaux étant dans la zone par défaut se retrouvent dans la zone bloquée : 
```
sudo firewall-cmd --list-all
block (active)
  target: %%REJECT%%
  icmp-block-inversion: no
  interfaces: enp0s3 enp0s8
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 

```

## I. Setup serveur Web

On va faire un p'ti `yum install nginx` sur le poste 1.

Ensuite on va créer deux serveurs NGINX, pour ça on fait deux dossiers dans la partition `srv`, à savoir site1 et site2, et dans ces dossiers ont fait un fichier index.html.

