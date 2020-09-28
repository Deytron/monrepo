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

Enfin on va ajouter un user à notre machine qui va pouvoir faire les commandes avec sudo et son mot de passe. On fait un petit `useradd -m user1` et on ajouter ce dernier dans la liste des sudoers avec `sudo visudo` : 
```
root    ALL=(ALL)       ALL
user1 ALL=(ALL) ALL
```

## I. Setup serveur Web

On va faire un p'ti `yum install nginx` sur le poste 1.

Ensuite on va créer deux serveurs NGINX, pour ça on fait deux dossiers dans la partition `srv`, à savoir site1 et site2, et dans ces dossiers ont fait un fichier index.html. On le repli avec des trucs bidons juste pour voir si tout marche bien. Simple et efficace.

On attribue la propriété de ces dossier à l'utilisateur user1 et au groupe nginx avec `chown user1:nginx /srv/siteX`, c'est ce qui est demandé. A partir de là, il va falloir faire un peu de config pour lancer le serveur NGINX. On en a deux à faire tourner. Il y a déjà un fichier de config présent et structuré dans `/etc/nginx/nginx.conf`. On va le modifier pour le faire diriger sur /srv pour qu'il trouve les fichiers à aller chercher. Voici notre premier serveur : 
```
    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  node1.tp1.b2;
#        root         /srv/data1;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location /data1 {
                alias /srv/data1;
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
```
On lui a donné un servername pour pouvoir aller le chercher, puis on a inclus dans la location ce qu'on devra préciser comme chemin pour trouver le serveur en question, enfin dans "alias" on a précisé le chemin absolu de l'emplacement des fichiers du serveur, à savoir /srv/data1 (site1 si on veut).

Pour tester si ça marche, on lance NGINX avec `sudo nginx` et on vient curl notre site : 
```
[user1@node1 ~]$ curl node1.tp1.b2/data1 -L
<!DOCTYPE html>
<html>
<body>

<h1>Wsh c'est le premier site</h1>

<p>Tranquille ou quoi</p>

</body>
</html>
```

On peut même essayer avec le pc node2 : 
```
[lemalgache@node2 ~]$ curl https://node1.tp1.b2/data2 --insecure -L
<!DOCTYPE html>
<html>
<body>

<h1>Wsh c'est le deuxieme site</h1>

<p>Tranquille ou quoi</p>

</body>
</html>
```

(Oui j'ai triché un peu sur les arguments mais c'est pour montrer que ça marche)

## II. Script de sauvegarde

Maintenant faut faire un script pour sauvegarder notre beau serveur. Voilà mon script, il est pas optimisé du tout mais il a le mérite de marcher : 
```bash
#!/bin/bash
# Script pour le TP backup de site1 et site2

if [ -z $1 ]
then
        echo "Précise un site fdp"
        exit 7
elif [ $1 != "site1" -a $1 != "site2" ]
then
        echo "ERREUR : Indique site1 ou site2 zebi"
        exit 7
elif [ "$1" == "site1" ] 
then
        tar -czf site1_$(date +"%Y%m%d_%H%M%S").tar.gz /srv/data1
        if [[ $(ls -1 /home/backup/site1 | wc -l) == 8 ]]
        then
        rm "$(ls -t | tail -1)"
        echo "Supprimé le fichier le plus ancien, trop de sauvegardes" 
        fi
        mv /home/backup/*.gz /home/backup/site1
elif [ "$1" == "site2" ]
then
        tar -czf site2_$(date +"%Y%m%d_%H%M%S").tar.gz /srv/data2
        if [[ $(ls -1 /home/backup/site2 | wc -l) == 8 ]]
        then
        rm "$(ls -t | tail -1)"
        echo "Supprimé le fichier le plus ancien, trop de sauvegardes"
        fi
        mv /home/backup/*.gz /home/backup/site2
fi
```

Maintenant il faut l'enclencher le script, sinon ça sert à rien. Crontab va nous aider à faire ça, c'est un utilitaire de planificartion de tâche, surtout utilisé pour les backups réguliers.

On va mettre notre utilisateur backup dans le groupe cron pour l'autoriser à faire des backups. Pour se faire, on crée un fichier avec `vim /etc/cron.allow` où on y inscrit tout simplement `backup`. 
Maintenant on va éditer notre fichier de cron pour lui dire quoi faire et quand. Y a une syntaxe un peu particulière, représentée comme suit : 
```bash
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  user command to be executed
```
Donc on va lui demander d'éxecuter notre fichier de script toutes les heures, de cette manière : 
```bash
#Commande de backup du site 1
00 */1 * * * /home/backup/tp1_backup.sh site1

#Commande de backup du site 2
00 */1 * * * /home/backup/tp1_backup.sh site2

```
et boum.

## III. Monitoring, alerting

Pour installer netdata, qui est un outil de monitoring simple à installer, on lane la commande : 
```bash
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
```




