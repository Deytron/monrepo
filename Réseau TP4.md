
--- ---

# I. Topologie 1 : simple

### 2\. Mise en place

#### A. Topologie GNS3

![](https://i.imgur.com/vStbWYa.png)

Ici le setup de base. Tout va bien, la VM CentOS est à gauche, le VPC à droite, le routeur Cisco en haut.  
Il faut qu’on paramètre les IP des PC selon le tableau d’adressage. J’ai donc modifié le fichier `ifcfg-enp0s9` de ma VM CentOS 7, et utilisé la commande `ip 10.4.2.11` dans la console du VPC.  
J’ai aussi pensé à changer le hostname d’admin1.

J’ai ensuite paramétré le routeur Cisco. J’ai utilisé dans l’ordre `conf t`, `interface fastEthernet 0/0`(Pour le VPCS), `ip address 10.4.2.254 255.255.255.0`, puis `no shut` pour l’activer. Même chose avec `fastEthernet 1/0`(Pour l’admin1) et `ip address 10.4.1.254 255.255.255.0` et `no shut`.

On teste, les ping fonctionnent , le routeur peut rejoindre les deux machines :

    R1#ping 10.4.2.11  

    Type escape sequence to abort.  
    Sending 5, 100-byte ICMP Echos to 10.4.2.11, timeout is 2 seconds:  
    !!!!!  
    Success rate is 100 percent (5/5), round-trip min/avg/max = 36/36/40 ms  
    R1#ping 10.4.1.11  

    Type escape sequence to abort.  
    Sending 5, 100-byte ICMP Echos to 10.4.1.11, timeout is 2 seconds:  
    !!!!!  
    Success rate is 100 percent (5/5), round-trip min/avg/max = 36/42/52 ms

Ping `guest1` vers `R1` :

    guest1> ping 10.4.2.254  
    84 bytes from 10.4.2.254 icmp_seq=1 ttl=255 time=8.670 ms  
    84 bytes from 10.4.2.254 icmp_seq=2 ttl=255 time=1.344 ms  
    84 bytes from 10.4.2.254 icmp_seq=3 ttl=255 time=22.398 ms  
    84 bytes from 10.4.2.254 icmp_seq=4 ttl=255 time=10.707 ms

Ping `admin1` vers `R1` : (oui j’arrive pas à SSH mon admin1)  
![](https://i.imgur.com/rvP351H.png)

Table ARP du `routeur` :

    R1#show arp  
    Protocol Address Age (min) Hardware Addr Type Interface  
    Internet 10.4.1.11 1 0800.27ef.6404 ARPA FastEthernet1/0  
    Internet 10.4.2.11 1 0050.7966.6800 ARPA FastEthernet0/0

MACs :

    guest1> show ip
    MAC : 00:50:79:66:68:00

`admin1` :  
![](https://i.imgur.com/iZpRAaj.png)

On est bon sisi.

### C. Routage

On ajoute une route pour pouvoir pinger le réseau guests. Comme d’hab, on crée un fichier `route-enp0s8` où on y inscrit ceci :  
`10.4.2.0/24 via 10.4.2.254 dev enp0s8`

Après un ifdown/ifup, on teste de ping `guest1` :  
![](https://i.imgur.com/kWTsoco.png)

Pour le VPCS, on rajoute une passerelle par défaut en l’ajoutant à la commande d’ajout d’IP. Soit `ip 10.4.1.11 /24 10.4.1.254`. Et on teste le ping :

    guest1> ping 10.4.1.11  
    84 bytes from 10.4.1.11 icmp_seq=1 ttl=63 time=21.573 ms  
    84 bytes from 10.4.1.11 icmp_seq=2 ttl=63 time=21.855 ms

On vérifie que les paquets passent bien par le routeur avec un `trace` :

    guest1> trace 10.4.1.11  
    trace to 10.4.1.11, 8 hops max, press Ctrl+C to stop  
    1 10.4.2.254 9.476 ms 12.243 ms 10.711 ms  
    2 *10.4.1.11 27.277 ms (ICMP type:3, code:10, Host administratively prohibited)

## III. Topologie 3 : adding nodes and NAT

### 2\. Mise en place

### A. Topologie GNS3

On fait la topologie oklm

![](https://i.imgur.com/XnsUtVB.png)  
On refait tout le paramétrage, mais sur chaque machine.  
Pour les guest 1,2 et 3, on met l’IP et le gateway avec `10.4.2.(11,12,13) /24 10.4.2.254` et boum, c’est fait, les machines peuvent communiquer entre elles (le switch se charge de ça).  
Pour l’admin1, on garde tout pareil ça change pas, et pour le routeur, on remet les interfaces 0/0 et 1/0\. Une fois ceci fait, toutes les machines peuvent se ping entre elles (la NAT n’étant pas encore configurée, pas d’accès internet)  
Ping de `guest3` vers `guest2` :

    guest3> ping 10.4.2.12  
    84 bytes from 10.4.2.12 icmp_seq=1 ttl=64 time=0.656 ms  
    84 bytes from 10.4.2.12 icmp_seq=2 ttl=64 time=0.436 ms  
    84 bytes from 10.4.2.12 icmp_seq=3 ttl=64 time=0.845 ms  
    84 bytes from 10.4.2.12 icmp_seq=4 ttl=64 time=1.532 ms

Ping de guest2 vers `admin1`:

    guest2> ping 10.4.1.11  
    84 bytes from 10.4.1.11 icmp_seq=1 ttl=63 time=19.685 ms  
    84 bytes from 10.4.1.11 icmp_seq=2 ttl=63 time=19.026 ms  
    84 bytes from 10.4.1.11 icmp_seq=3 ttl=63 time=17.701 ms  
    84 bytes from 10.4.1.11 icmp_seq=4 ttl=63 time=17.568 ms

Les guests peuvent pinger le réseau Admins :

    guest2> ping 10.4.1.254  
    84 bytes from 10.4.1.254 icmp_seq=1 ttl=255 time=2.876 ms  
    84 bytes from 10.4.1.254 icmp_seq=2 ttl=255 time=10.023 ms  
    84 bytes from 10.4.1.254 icmp_seq=3 ttl=255 time=8.366 ms

### [](#c-acc%C3%A8s-wan)C. Accès WAN

On file un accès WAN au routeur en réglant une interface sur la NAT (ici 2/0) et, au lieu de définir une IP avec `ip address XXX`, on fait `ip address dhcp`. C’est dans le tuto. Mais c’est pas encore fini.  
Il faut configurer la NAT sur le routeur. Pour ça, encore dans le tuto, on définit d’abord les interfaces internes et externes. Les interfaces externes, ce sont celles qui sont connectées à la NAT (soit uniquement 2/0), les autres c’est les LAN (soit 0/0 et 1/0).  
On utilise `ip nat outside` pour marquer comme externe notre interface 2/0  
On fait `ip nat inside` pour nos interfaces Admins et guests, 1/0 et 0/0.

Après, on autorise le traffic sur l’interface 2/0 avec `access-list 1 permit any` et on active la NAT avec `ip nat inside source list 1 interface fastEthernet 2/0 overload`. Et bim. On a bien une IP donnée via DHCP.

    R1#show ip int br  
    Interface IP-Address OK? Method Status Protocol  
    FastEthernet0/0 10.4.2.254 YES NVRAM up up  
    FastEthernet1/0 10.4.1.254 YES NVRAM up up  
    FastEthernet2/0 192.168.122.103 YES DHCP up up  
    FastEthernet3/0 unassigned YES NVRAM administratively down down  
    NVI0 unassigned NO unset up up

On va maintenant configurer le DNS de nos machines. Simple, trop simple. Pour les guests, on fait `ip dns 1.1.1.1`. Pour la machine `admin1`, on modifie le fichier dans `/etc/resolv.conf` et on y met `nameserver 1.1.1.1`  
(Bon en vrai ça y est déjà de base).  
Pour le routeur, le DNS devrait déjà être activé de base. Au cas où, j’ai quand même fait un `ip domain-lookup` pour l’activer.

On teste, et boum le routeur a un accès internet :

    R1#ping pornhub.com  

    Translating "pornhub.com"...domain server (192.168.122.1) [OK]  

    Type escape sequence to abort.  
    Sending 5, 100-byte ICMP Echos to 66.254.114.41, timeout is 2 seconds:  
    !!!!!  
    Success rate is 100 percent (5/5), round-trip min/avg/max = 16/31/40 ms

Ok, le routeur va sur internet, mais pas nos PC en local. Il manque un protocole qu’on doit activer.  
Toujours dans le tuto, on va activer l’OSPF et faire en sorte que notre serveur réponde en tant que 1.1.1.1 (puisque le DNS qu’on a mis sur nos machine). Pour ça, on fait les commandes `router ospf 1` pour activer l’OSPF, puis `router-id 1.1.1.1`, et enfin `network 10.4.2.0 0.0.0.255 area 0` pour donner l’accès à nos machines sur le réseau Guests. On fait `network 10.4.1.0 0.0.0.255 area 0` pour la machine sur le réseau Admins.

On teste une machine guest :
```bash
guest1> ping pornhub.com
pornhub.com resolved to 66.254.114.41
84 bytes from 66.254.114.41 icmp_seq=1 ttl=59 time=40.394 ms
84 bytes from 66.254.114.41 icmp_seq=2 ttl=59 time=58.896 ms
84 bytes from 66.254.114.41 icmp_seq=3 ttl=59 time=40.101 ms
84 bytes from 66.254.114.41 icmp_seq=4 ttl=59 time=41.542 ms
```

Ca marche tranquille. On teste maintenant avec notre machine CentOS Admin1 :
![](https://i.imgur.com/YaNxSaH.png)
Tout roule. Le DNS fonctionne partout.

❕Il y a un léger bug avec GNS3 où l'accès Internet ne fonctionne plus après un redémarrage de toute la topologie. Pour régler le problème, il faut entrer dans les paramètres du routeur ``clear ip nat translation *``, puis refaire la commande pour activer la NAT, à savoir ``interface fastEthernet {NUM}`` ,``ip nat inside`` puis ``ip nat inside source list 1 interface fastEthernet 2/0 overload``.
## IV. Topologie 4 : home-made DHCP
On rajoute une p'tite VM dhcp1 :
![](https://i.imgur.com/GcqPex3.png)
On la configure comme d'hab, on met le hostname ``dhcp1`` et l'IP du tableau, à savoir ``10.4.2.253``. Il est temps de passer à l'action.

Changement total de plan puisqu'on va passer tous les PC guests en IP DHCP. Mais avant ça, il nous faut ledit DHCP. Pour ça, on suit le tuto et on installe le paquet DHCP avec ``sudo yum install dhcp -y``. Une fois fait, on va venir copier/coller-- ah bah non, on va venir recopier à la main le script de Léo. Ouais  c'est bien bo d'avoir un script déjà fait, mais on rappelle qu'on a pas d'accès SSH aux VM, que le copier/coller VM/machine fonctionne pas (??) et que j'ai la flemme de faire un SCP ou quoi que ce soit d'autre, donc tant pis. Go dans ``/etc/dhcp`` et faire le fichier ``dhcpd.conf``

Une fois fait, on démarre le service avec ``sudo systemctl start dhcpd``. Si le fichier de config est bien configuré, tout fonctionne.

On check qu'on a bien le port 67 présent :
![](https://i.imgur.com/IWlaqYK.png)
On give des adresses IP à nos guests avec  ``ip dhcp`` :
```bash
guest1> ip dhcp  
DDORA IP 10.4.2.100/24 GW 10.4.2.254
```
```bash
guest2> ip dhcp  
DDORA IP 10.4.2.101/24 GW 10.4.2.254
```
```bash
guest3> ip dhcp  
DDORA IP 10.4.2.102/24 GW 10.4.2.254
```

On peut vérifier qu'on a bien le DORA avec Wireshark :
![](https://i.imgur.com/irloQ1f.png)
Et bim.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTMzMjI0MDEzNSwxMjM3NTkwNTgzLDE5OD
A5MzU1NzgsMjQ2OTg5Mzg0LC0xMzc0MzA1Mzg5LC0xMTE2NDg2
MTU5XX0=
-->