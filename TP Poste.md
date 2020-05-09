# Maîtrise de poste - Day 1
Bon on va faire des choses très simples t'as capté, on va chopper les infos de notre PC. En gros on apprend à se connaître nous-même. C'est beau.
### Host OS
Sur Linux, on a tout plein de manières d'obtenir les infos système. Mais on va faire ça sans utility. 
On peut utiliser `uname -a` pour avoir les infos de base sur Linux.
```bash
uname -a
Linux Malgache-Zenbook 5.6.3-2-MANJARO #1 SMP PREEMPT Wed Apr 8 20:57:18 UTC 2020 x86_64 GNU/Linux
```
On a pas la RAM par contre. Pour la voir dans le terminal, on peut utiliser `cat /proc/meminfo` 
```bash
cat /proc/meminfo
MemTotal: 8001432 kB  
MemFree: 759864 kB  
MemAvailable: 2676836 kB
```
Comme ça on a les infos de la mémoire en temps réel. Pour avoir les infos précises de la RAM, on fait `sudo dmidecode --type memory`
```bash
sudo dmidecode --type memory
# dmidecode 3.2  
Getting SMBIOS data from sysfs.  
SMBIOS 3.2.1 present.  
# SMBIOS implementations newer than version 3.2.0 are not  
# fully supported by this version of dmidecode.  
  
Handle 0x0008, DMI type 16, 23 bytes  
Physical Memory Array  
Location: System Board Or Motherboard  
Use: System Memory  
Error Correction Type: None  
Maximum Capacity: 32 GB  
Error Information Handle: Not Provided  
Number Of Devices: 2  
  
Handle 0x002B, DMI type 17, 84 bytes  
Memory Device  
Array Handle: 0x0008  
Error Information Handle: Not Provided  
Total Width: 64 bits  
Data Width: 64 bits  
Size: 4096 MB  
Form Factor: SODIMM  
Set: None  
Locator: ChannelA-DIMM0  
Bank Locator: BANK 0  
Type: DDR4  
Type Detail: Synchronous  
Speed: 2400 MT/s  
Manufacturer: Samsung  
Serial Number: 00000000  
Asset Tag: 9876543210  
Part Number: M471A5244CB0-CRC  
Rank: 1  
Configured Memory Speed: 2400 MT/s  
Minimum Voltage: 1.2 V  
Maximum Voltage: 1.2 V  
Configured Voltage: 1.2 V  
Memory Technology: DRAM  
Memory Operating Mode Capability: Volatile memory  
Firmware Version: Not Specified  
Module Manufacturer ID: Bank 1, Hex 0xCE  
Module Product ID: Unknown  
Memory Subsystem Controller Manufacturer ID: Unknown  
Memory Subsystem Controller Product ID: Unknown  
Non-Volatile Size: None  
Volatile Size: 4 GB  
Cache Size: None  
Logical Size: None  
  
Handle 0x002C, DMI type 17, 84 bytes  
Memory Device  
Array Handle: 0x0008  
Error Information Handle: Not Provided  
Total Width: 64 bits  
Data Width: 64 bits  
Size: 4096 MB  
Form Factor: SODIMM  
Set: None  
Locator: ChannelB-DIMM0  
Bank Locator: BANK 2  
Type: DDR4  
Type Detail: Synchronous  
Speed: 2400 MT/s  
Manufacturer: Samsung  
Serial Number: 00000000  
Asset Tag: 9876543210  
Part Number: M471A5244CB0-CRC  
Rank: 1  
Configured Memory Speed: 2400 MT/s  
Minimum Voltage: 1.2 V  
Maximum Voltage: 1.2 V  
Configured Voltage: 1.2 V  
Memory Technology: DRAM  
Memory Operating Mode Capability: Volatile memory  
Firmware Version: Not Specified  
Module Manufacturer ID: Bank 1, Hex 0xCE  
Module Product ID: Unknown  
Memory Subsystem Controller Manufacturer ID: Unknown  
Memory Subsystem Controller Product ID: Unknown  
Non-Volatile Size: None  
Volatile Size: 4 GB  
Cache Size: None  
Logical Size: None
```
### Devices
`lspci` nous permet d'obtenir tous les périphériques et cartes connectées à notre carte mère.
```bash
lspci  127 ✘   
00:00.0 Host bridge: Intel Corporation Coffee Lake HOST and DRAM Controller (rev 0b)  
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 620 (Whiskey Lake)  
00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (re  
v 0b)  
00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture  
Model  
00:12.0 Signal processing controller: Intel Corporation Cannon Point-LP Thermal Controller (rev 30)  
00:14.0 USB controller: Intel Corporation Cannon Point-LP USB 3.1 xHCI Controller (rev 30)  
00:14.2 RAM memory: Intel Corporation Cannon Point-LP Shared SRAM (rev 30)  
00:14.3 Network controller: Intel Corporation Cannon Point-LP CNVi [Wireless-AC] (rev 30)  
00:15.0 Serial bus controller [0c80]: Intel Corporation Cannon Point-LP Serial IO I2C Controller #0 (rev 30)  
00:15.1 Serial bus controller [0c80]: Intel Corporation Cannon Point-LP Serial IO I2C Controller #1 (rev 30)  
00:16.0 Communication controller: Intel Corporation Cannon Point-LP MEI Controller #1 (rev 30)  
00:17.0 SATA controller: Intel Corporation Cannon Point-LP SATA Controller [AHCI Mode] (rev 30)  
00:19.0 Serial bus controller [0c80]: Intel Corporation Cannon Point-LP Serial IO I2C Host Controller (rev 30)  
00:1c.0 PCI bridge: Intel Corporation Cannon Point-LP PCI Express Root Port #1 (rev f0)  
00:1c.4 PCI bridge: Intel Corporation Cannon Point-LP PCI Express Root Port #5 (rev f0)  
00:1d.0 PCI bridge: Intel Corporation Cannon Point-LP PCI Express Root Port #13 (rev f0)  
00:1f.0 ISA bridge: Intel Corporation Cannon Point-LP LPC Controller (rev 30)  
00:1f.3 Audio device: Intel Corporation Cannon Point-LP High Definition Audio Controller (rev 30)  
00:1f.4 SMBus: Intel Corporation Cannon Point-LP SMBus Controller (rev 30)  
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Point-LP SPI Controller (rev 30)  
02:00.0 3D controller: NVIDIA Corporation GP107M [GeForce GTX 1050 Mobile] (rev a1)  
03:00.0 Non-Volatile memory controller: Micron/Crucial Technology P1 NVMe PCIe SSD (rev 03)
```
Par contre y en a elles sont incomplètes ou manquantes. Donc on va approfondir, en utilisant `lscpu`
```bash
lscpu 
Architecture : x86_64  
Mode(s) opératoire(s) des processeurs : 32-bit, 64-bit  
Boutisme : Little Endian  
Tailles des adresses: 39 bits physical, 48 bits virtual  
Processeur(s) : 8  
Liste de processeur(s) en ligne : 0-7  
Thread(s) par cœur : 2  
Cœur(s) par socket : 4  
Socket(s) : 1  
Nœud(s) NUMA : 1  
Identifiant constructeur : GenuineIntel  
Famille de processeur : 6  
Modèle : 142  
Nom de modèle : Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz  
Révision : 11  
Vitesse du processeur en MHz : 1000.001  
Vitesse maximale du processeur en MHz : 4600,0000  
Vitesse minimale du processeur en MHz : 400,0000
```
Voilà j'ai pas mis toutes les infos mais on a tout. J'ai un intel Core i7 8565U, on va décortiquer tout ça. 
- Intel c'est la marque 
- Core c'est leur gamme de proco grand public 
- i3/5/7/9 c'est leur gamme de puissance on va dire
- 8, le premier chiffre, c'est la génération de proco
- 565, les chiffres après, pour faire simple, plus c'est grand plus c'est puissant. On rappelle qu'Intel a vraiment du mal à nommer ses processeurs, c'est pas très clair.
- U, la lettre à la fin, indique l'utilisation destinée du processeur. Par exemple, le K signifie que le proco est overclockable. U veut dire que le proco est designé pour les ordis portables et a donc un TDP réduit.

Pour les enceintes intégrées, on peut utiliser `cat /proc/asound/cards` qui va nous afficher la carte son utilisée
```bash
cat /proc/asound/cards
0 [PCH ]: HDA-Intel - HDA Intel PCH  
HDA Intel PCH at 0xb4318000 irq 148
```

- Pour le trackpad, j'ai utilisé `cat /proc/bus/input/devices | grep Touchpad` et voilà.
```bash
cat /proc/bus/input/devices | grep Touchpad  
N: Name="GDX1505:00 27C6:01F1 Touchpad"
```
Là le modèle c'est un GDX1505.
Pour voir les infos des disques durs et leur partition, on utilise `fdisk -l` et hop on a tout. (Oui les systèmes de fichiers sont notés en français)
```bash
sudo fdisk -l
Disque /dev/nvme0n1 : 931,53 GiB, 1000204886016 octets, 1953525168 secteurs  
Modèle de disque : CT1000P1SSD8  
Unités : secteur de 1 × 512 = 512 octets  
Taille de secteur (logique / physique) : 512 octets / 512 octets  
taille d'E/S (minimale / optimale) : 512 octets / 512 octets  
Type d'étiquette de disque : gpt  
Identifiant de disque : 89B23785-8DB4-41ED-A14D-3AFA098DCAFD  
  
Périphérique  Début  Fin  Secteurs  Taille  Type  
/dev/nvme0n1p1 2048 1085439 1083392 529M Environnement de récupération Windows  
/dev/nvme0n1p2 1085440 1288191 202752 99M Système EFI  
/dev/nvme0n1p3 1288192 1320959 32768 16M Réservé Microsoft  
/dev/nvme0n1p4 1320960 1524758527 1523437568 726,4G Données de base Microsoft  
/dev/nvme0n1p5 1524758528 1525168127 409600 200M Données de base Microsoft  
/dev/nvme0n1p6 1525168128 1547696127 22528000 10,8G Partition d'échange Linux  
/dev/nvme0n1p7 1547696128 1953525134 405829007 193,5G Système de fichiers Linux
```
Sur mon système, y a plusieurs systèmes de fichiers.

**FAT32** : Système de fichier créé par Microsoft. a la particularité d'être très vieux et d'avoir une taille max par fichier de 4go et 2To max total.

**LinuxSwap** : Partition swap spéciale Linux, sur Windows c'est remplacé par un fichier "pagefile.sys". Aussi appelée en français, fichier de pagination (haha). En gros le swap c'est quand y a plus assez de RAM, plutôt que de tenter de continuer à stocker des infos dans la RAM, les programmes vont stocker leurs infos dans la partition/le fichier de swap, ce qui veut dire que c'est le disque qui va être utilisé, ce qui est genre 100x plus lent que la RAM. Ca permet d'éviter les plantages, mais la fluidité du programme peut être impactée.

**NTFS** : Système de fichier créé par Microsoft. Nouveau standard utilisé partout (mais a quelques petits soucis avec Linux), il peut avoir en pratique une taille max par fichier de 16To et une taille de volume max de 256To.

### Network
On repart sur du classique, pour voir nos cartes réseaux on fait `ip a`
```bash
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000  
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
inet 127.0.0.1/8 scope host lo  
valid_lft forever preferred_lft forever  
inet6 ::1/128 scope host  
valid_lft forever preferred_lft forever  
2: wlo1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000  
link/ether d0:c6:37:81:8f:c6 brd ff:ff:ff:ff:ff:ff  
inet 192.168.1.87/24 brd 192.168.1.255 scope global dynamic noprefixroute wlo1  
valid_lft 71918sec preferred_lft 71918sec  
inet6 fe80::5b36:ffa2:486f:a993/64 scope link noprefixroute  
valid_lft forever preferred_lft forever  
3: vboxnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000  
link/ether 0a:00:27:00:00:00 brd ff:ff:ff:ff:ff:ff  
inet 192.168.56.1/24 brd 192.168.56.255 scope global vboxnet0  
valid_lft forever preferred_lft forever  
inet6 fe80::800:27ff:fe00:0/64 scope link  
valid_lft forever preferred_lft forever
```
- lo : C'est la loopback, présente sur tout PC et utilisée à des fins de tests.
- wlo1 : C'est ma carte wifi, *wlo* parce que **W**ire**L**ess.
- vboxnet0 : Ma carte réseau privé hôte liée à VirtualBox.

Pour voir les ports TCP et UDP en utilisation et leur programme, on fait :
```bash
ss -tup
Netid State Recv-Q Send-Q Local Address:Port Peer Address:Port Process  
udp ESTAB 0 0 192.168.1.87:57172 216.58.204.142:https users:(("chrome",pid=1629,fd=66))  
udp ESTAB 0 0 192.168.1.87:49158 172.217.19.238:https users:(("chrome",pid=1629,fd=62))  
udp ESTAB 0 0 192.168.1.87%wlo1:bootpc 192.168.1.254:bootps  
udp ESTAB 0 0 192.168.1.87:58632 216.58.213.142:https users:(("chrome",pid=1629,fd=60))  
udp ESTAB 0 0 192.168.1.87:34117 172.217.19.227:https users:(("chrome",pid=1629,fd=35))  
udp ESTAB 0 0 192.168.1.87:38294 216.58.213.142:https users:(("chrome",pid=1629,fd=57))  
udp ESTAB 0 0 192.168.1.87:50947 172.217.19.228:https users:(("chrome",pid=1629,fd=33))  
udp ESTAB 0 0 192.168.1.87:38889 216.58.201.238:https users:(("chrome",pid=1629,fd=64))  
tcp ESTAB 0 0 192.168.1.87:44706 104.18.71.113:https users:(("chrome",pid=1629,fd=56))  
tcp ESTAB 0 0 192.168.1.87:54850 172.217.19.238:https users:(("chrome",pid=1629,fd=67))  
tcp ESTAB 0 0 192.168.1.87:45554 104.22.11.214:https users:(("chrome",pid=1629,fd=65))  
tcp ESTAB 0 0 192.168.1.87:35684 140.82.118.5:https users:(("chrome",pid=1629,fd=43))  
tcp ESTAB 0 0 192.168.1.87:60008 104.31.69.212:https users:(("chrome",pid=1629,fd=54))  
tcp ESTAB 0 0 192.168.1.87:37688 172.217.19.246:https users:(("chrome",pid=1629,fd=72))  
tcp ESTAB 0 0 192.168.1.87:41364 192.168.1.68:nvme-disc users:(("chrome",pid=1629,fd=44))  
tcp ESTAB 0 0 192.168.1.87:59424 13.225.31.111:https users:(("chrome",pid=1629,fd=39))  
tcp ESTAB 0 0 192.168.1.87:48920 74.125.133.188:hpvroom users:(("chrome",pid=1629,fd=41))  
tcp ESTAB 0 0 192.168.1.87:59678 13.225.31.90:https users:(("chrome",pid=1629,fd=58))  
tcp ESTAB 0 0 192.168.1.87:52734 104.31.72.18:https users:(("chrome",pid=1629,fd=69))  
tcp ESTAB 0 0 192.168.1.87:59334 104.18.70.113:https users:(("chrome",pid=1629,fd=59))  
tcp ESTAB 0 0 192.168.1.87:48208 192.168.1.61:nvme-disc users:(("chrome",pid=1629,fd=47))  
tcp ESTAB 0 0 192.168.1.87:35860 104.22.65.200:https users:(("chrome",pid=1629,fd=36))  
tcp ESTAB 0 0 192.168.1.87:42422 151.101.122.217:https users:(("chrome",pid=1629,fd=50))  
tcp ESTAB 0 0 192.168.1.87:34772 216.58.204.142:https users:(("chrome",pid=1629,fd=24))  
tcp ESTAB 0 0 192.168.1.87:43052 37.187.145.101:https users:(("chrome",pid=1629,fd=38))  
tcp ESTAB 0 0 192.168.1.87:45446 216.58.215.33:https users:(("chrome",pid=1629,fd=70))  
tcp ESTAB 0 0 192.168.1.87:44746 35.241.14.4:https users:(("chrome",pid=1629,fd=28))  
tcp ESTAB 0 0 192.168.1.87:53576 104.16.52.111:https users:(("chrome",pid=1629,fd=63))  
tcp ESTAB 0 0 192.168.1.87:50756 13.225.39.80:https users:(("chrome",pid=1629,fd=53))  
tcp ESTAB 0 0 192.168.1.87:35310 104.31.80.149:https users:(("chrome",pid=1629,fd=71))  
tcp ESTAB 0 0 192.168.1.87:48406 151.101.122.109:https users:(("chrome",pid=1629,fd=40))  
tcp ESTAB 0 0 192.168.1.87:50680 104.22.64.200:https users:(("chrome",pid=1629,fd=55))  
tcp ESTAB 0 0 192.168.1.87:60062 151.101.122.208:https users:(("chrome",pid=1629,fd=61))  
tcp ESTAB 0 0 192.168.1.87:59592 216.58.213.142:https users:(("chrome",pid=1629,fd=27))
```
Les programmes sont affichés à droite. C'est le `-p` dans la commande qui affiche le nom du processus. Ici, Chrome utilise plusieurs process et plusieurs ports.

### Users
Pour afficher les utilisateurs, on peut tout simplement faire `users`
```bash
users
lemalgache lemalgache lemalgache
```
Après on a pas tous les users. Donc on peut directement aller chercher dans le fichier passwd.
```bash
echo $(cut -d: -f1 /etc/passwd)\r 
root nobody dbus bin daemon mail ftp http systemd-journal-remote systemd-network systemd-resolve systemd-timesync systemd-cored  
ump uuidd dnsmasq rpc avahi colord cups flatpak geoclue git mpd nm-openconnect nm-openvpn ntp polkitd rtkit sddm tss usbmux lem  
algache nvidia-persistenced deluge gluster dhcpcd mysqlr
```
### Processus
Pour voir tous les processus, `powertop` est parfait, précis et intégré de base dans beaucoup de distrib Linux. Mais ça reste un outil tiers. La commande de base pour voir TOUS les processus, c'est `ps aux`.
```bash
ps aux
USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND  
root 1 0.0 0.1 172364 10508 ? Ss 17:44 0:00 /sbin/init  
root 2 0.0 0.0 0 0 ? S 17:44 0:00 [kthreadd]  
root 3 0.0 0.0 0 0 ? I< 17:44 0:00 [rcu_gp]  
root 4 0.0 0.0 0 0 ? I< 17:44 0:00 [rcu_par_gp]  
root 6 0.0 0.0 0 0 ? I< 17:44 0:00 [kworker/0:0H-kblockd]  
root 7 0.0 0.0 0 0 ? I 17:44 0:00 [kworker/u16:0-events_unbound]  
root 8 0.0 0.0 0 0 ? I< 17:44 0:00 [mm_percpu_wq]  
root 9 0.0 0.0 0 0 ? S 17:44 0:00 [ksoftirqd/0]  
root 10 0.0 0.0 0 0 ? S 17:44 0:00 [rcuc/0]  
root 11 0.0 0.0 0 0 ? I 17:44 0:01 [rcu_preempt]  
root 12 0.0 0.0 0 0 ? S 17:44 0:00 [rcub/0]  
root 13 0.0 0.0 0 0 ? S 17:44 0:00 [migration/0]  
root 14 0.0 0.0 0 0 ? S 17:44 0:00 [idle_inject/0]  
root 16 0.0 0.0 0 0 ? S 17:44 0:00 [cpuhp/0]
```
Et y a genre plein d'autres lignes, mais je vais pas tout montrer là.

Je vais chopper des processus important et les expliquer :
```bash
ps aux | grep plasmashell 
lemalga+ 1311 1.4 2.7 1828176 221796 ? Sl 17:44 0:44 /usr/bin/plasmashell  
lemalga+ 4576 0.0 0.0 6312 2276 pts/3 S+ 18:36 0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exc  
lude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox plasmashell
```
Plasma, ou plutôt KDE Plasma, c'est l'interface graphique utilisée sur mon Linux, le nom du process c'est `plasmashell`. En gros, si le processus meurt, j'ai plus mon environnement de bureau.
```bash
ps aux | grep init
root 1 0.0 0.1 172364 10508 ? Ss 17:44 0:00 /sbin/init  
lemalga+ 1233 0.0 0.0 2228 88 ? S 17:44 0:00 /usr/lib/kf5/start_kdeinit --kded +kcminit_startup  
lemalga+ 1234 0.0 0.2 101656 21248 ? Ss 17:44 0:00 kdeinit5: Running...
```
On oublie pas le process `init`, le POAT (Process Of All Time), qui est le premier truc qui s'enclenche au lancement de Linux et qui gère tous les autres process du système. Son PID sera toujours 1.
```bash
ps aux | grep Network 
root 795 0.0 0.2 404088 19808 ? Ssl 17:44 0:03 /usr/bin/NetworkManager
```
Le NetworkManager est un daemon qui gère tous les systèmes réseaux du PC. Sans lui, pas de connexion.
```bash
ps aux | grep x11  ✔   
root 1188 0.0 0.2 66876 22332 ? S 17:44 0:00 /usr/lib/sddm/sddm-helper --socket /tmp/sddm-authb0148e59-50  
0a-4339-b32d-0d7d6cd508d8 --id 1 --start /usr/bin/startplasma-x11 --user lemalgache  
lemalga+ 1212 0.0 0.1 125832 12068 ? Sl 17:44 0:00 /usr/bin/startplasma-x11
```
Le process X11/Xorg est un programme qui fournit un serveur X à Linux. Il permet de gérer tout ce qui est affiché à l'écran, il est utilisé notamment par les gestionnaires de fenêtres. Si le process meurt, c'est foutu écran noir, plus rien d'affiché.
```bash
ps aux | grep rtkit  ✔   
rtkit 1429 0.0 0.0 152684 2872 ? SNsl 17:44 0:00 /usr/lib/rtkit-daemon
```
Le daemon rtkit est... compliqué à expliquer. En gros, au lieu d'avoir un programme qui part demander au kernel des ressources et qui choppe les droits root au passage, l'application va demander à rtkit plutôt qu'au kernel. Rtkit gère les permissions pour demander des ressources au kernel, et donne les droits à un programme de le faire. L'intérêt ici c'est que c'est bien plus sécurisé que de directement filer des droits root à un programme.

Pour voir quel utilisateur a lancé un processus, on utilise `ps -u {UTILISATEUR}`.
```bash
ps -u lemalgache
PID TTY TIME CMD  
1201 ? 00:00:00 systemd  
1202 ? 00:00:00 (sd-pam)  
1212 ? 00:00:00 startplasma-x11  
1220 ? 00:00:00 dbus-daemon  
1233 ? 00:00:00 start_kdeinit  
1234 ? 00:00:00 kdeinit5
```
lemalgache est mon utilisateur admin sur la machine.

## Scripting
On est sur Linux, on fait des scripts en Bash. Simple et carré. 
Pourquoi Bash et pas SH ? Bah déjà parce que je connais bien Bash, et ensuite parce que c'est le langage interpréteur par défaut de la majorité des distributions Linux.
Sur Mac il existe AppleScript (?), ou JavaScript. Pas plus de détails là dessus puisque Mac peut aussi utiliser Bash.
Sur Window on utiliserait Powershell. Oui les scripts Batch en .bat existent, mais même si ils sont fonctionnels, il vaut mieux utiliser Powershell.

Voici l'output de mon script :
```
_____________________  
DUMP INFOS SYSTEMES  
_____________________  
  
  
Système d'exploitation : Linux x86_64 GNU/Linux  
  
Nom de l'ordinateur : Malgache-Zenbook  
  
Version : 5.6.7-1-MANJARO  
  
Adresse IP : 192.168.1.87/24  
  
Ordi allumé le : Apr 29 14:35  
  
Besoin de mise à jour ?Non  
  
RAM utilisée : 2180 Mo  
  
RAM utilisée : 3003 Mo  
  
__________________  
STOCKAGE  
__________________  
Espace utilisé : 573896932 Ko  
Espace libre : 187821816 Ko  
  
Utilisateurs sur le PC :  
root nobody dbus bin daemon mail ftp http systemd-journal-remote systemd-network systemd-resolve systemd-timesync systemd-cored  
ump uuidd dnsmasq rpc avahi colord cups flatpak geoclue git mpd nm-openconnect nm-openvpn ntp polkitd rtkit sddm tss usbmux lem  
algache nvidia-persistenced deluge gluster dhcpcd mysqlr  
  
__________________  
Ping vers google  
__________________  
Temps de réponse moyen : 14.070 ms  
  
__________________  
CONNEXION  
__________________  
  
Vitesse de téléchargement : 14.43 Mbit/s  
Vitesse d'upload : 5.74 Mbit/s
```
Et voilà le script en question, tout plein d'échos :
```bash
#!/bin/bash
echo  '_____________________'
echo  'DUMP INFOS SYSTEMES'
echo  '_____________________'
echo  ''
echo  ''
echo -n "Système d'exploitation : "
uname -a | awk 'NR==1{print $1,$13,$14}'
echo  ''
echo -n "Nom de l'ordinateur : "
uname -a | awk 'NR==1{print $2}'
echo  ''
echo -n "Version : "
uname -a | awk 'NR==1{print $3}'
echo  ''
echo -n "Adresse IP : "
ip a | grep dynamic | awk '{print $2}'
echo  ''
echo -n "Ordi allumé le : "
last | head -1 | awk '{print $5,$6,$7}'
echo  ''
echo -n "Besoin de mise à jour ?"
echo  "Non"
echo  ''
echo  "RAM utilisée : $(free -m | grep Mem | awk 'NR==1{print $3}') Mo"
echo  ''
echo  "RAM utilisée : $(free -m | grep Mem | awk 'NR==1{print $4}') Mo"
echo  ''
echo  '__________________'
echo  "STOCKAGE"
echo  '__________________'
echo  "Espace utilisé : $(df 2> /dev/null | tail -1 | awk 'NR==1{print $3}') Ko"
echo  "Espace libre : $(df 2> /dev/null | tail -1 | awk 'NR==1{print $4}') Ko"
echo  ''
echo  "Utilisateurs sur le PC : "
echo  $(cut -d: -f1 /etc/passwd)\r
echo  ''
echo  '__________________'
echo  "Ping vers google"
echo  '__________________'
echo  "Temps de réponse moyen : $(ping -c 1 8.8.8.8 | grep avg | awk 'NR==1{print $4}' | cut -d '/' -f 2) ms"
echo  ''
echo  '__________________'
echo  "CONNEXION"
echo  '__________________'
echo  ''
echo  "Vitesse de téléchargement : $(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - | tail -3 | awk 'NR==1{print $2,$3}')"
echo  "Vitesse d'upload : $(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - | tail -1 | awk 'NR==1{print $2,$3}')"
```
Après faut notre deuxième script pour verrouiller le PC après X secondes.
Le script est très simple, quand on le lance il demande si on veut lock le PC ou l'éteindre, et si on veut l'éteindre, il demande en minutes dans combien de temps. 
Voilà le script :
```bash
#!/bin/bash

echo  "Tapez 1 pour lock l'écran, 2 pour éteindre le PC : "
read choix$choix
if [ $choix == 1 ]; then
	xdotool key Super_L+l
elif [ $choix == 2 ]; then
	echo  "Entrez en minutes dans combien de temps éteindre le PC : "
	read minutes$minutes
	shutdown -h $minutes
else
	echo  "Ouais nan mais gros tu forces là"
fi
```
Voilà voilà.
## Gestion de softs
Les gestionnaires de paquets, ou package manager dans la langue de Shakespeare, c'est cool, c'est automatique, ça fait gagner du temps. L'avantage d'un gestionnaire de paquet par rapport au téléchargement d'un programme sur Internet, c'est que tout se trouve au même endroit. Besoin de télécharger Chrome ? T'ouvres le package manager. Besoin de Steam ? Pareil. Pas besoin d'aller sur le site. (Evidemment faut que le programme en question soit disponible dans le manager).

Selon les paramètres utilisés avec le gestionnaire de paquet, on peut restreindre les paquets affichés et par exemple, ne vouloir télécharger que des paquets sûrs/vérifiés, ou venant d'un certain éditeur. Cela permet d'éviter de télécharger portant le même nom qu'un autre mais venant d'un hacker russe. 

btw i use arch, donc mon gestionnaire de paquets s'appelle `pacman`. La version graphique s'appelle `pamac`. 
Avec Pacman, pour voir les paquets installés on utilise la commande `pacman -Qe`
```bash
pacman -Qe
acpi 1.7-2  
acpid 2.0.32-1  
alsa-firmware 1.2.1-2  
alsa-utils 1.2.2-1  
android-tools 29.0.6-1  
android-udev 20200410-1  
apparmor 2.13.4-1
```
Les paquets sont tous issus de ce qu'on appelle un repo. C'est de là qu'ils proviennent, et chaque distro Linux a certains repo et miroirs disponibles d'entrée de jeu.
Avec pacman, les repos sont dans un fichier appelé `mirrorlist`
```
cat /etc/pacman.d/mirrorlist                                                                                  ✔ 
##
## Manjaro Linux custom mirrorlist
## Generated on 2020-05-02 03:42
##
## Please use 'pacman-mirrors -id' To reset custom mirrorlist
## Please use 'pacman-mirrors -c all' To reset custom mirrorlist
## To remove custom config run  'pacman-mirrors -c all'
##

## Country : France
Server = http://kibo.remi.lu/stable/$repo/$arch

## Country : France
Server = https://manjaro.mcofficer.me/stable/$repo/$arch

## Country : France
Server = https://manjaro.ynh.ovh/stable/$repo/$arch
```
## Partage de fichiers
Bon on va pas se mentir, Microsoft fait bien son taf et le partage de fichiers est très bien intégré dans Windows 10. Il est pas mauvais pour autant sur Linux, mais il faut installer Samba. Beaucoup de distro l'ont déjà de base.

Avec Manjaro KDE, j'ai dû faire cette commande pour être sûr d'avoir tout ce qu'il faut :
``pamac install samba kdenetwork-filesharing manjaro-settings-samba``
après j'ai dû redémarrer le PC pour enclencher tous les services.
Une fois ceci fait, faut faire quelques étapes en plus. D'abord, faut aller éditer le fichier de config dans `/etc/samba/smb.conf` et ajouter des lignes suivant ce schéma :
```
[NomRandom]
comment = Entrer un commentaire
path = chemin/du/dossier
browseable = yes
read only = no
```
Moi j'ai ajouté un dossier dans mon doss personnel qui s'appelle `samba`, tout simple. Tout ça c'est si on veut ajouter un dossier spécifique au serveur samba.
Maintenant faut qu'on s'ajoute un mot de passe samba pour pouvoir accéder au dossier. Pour ça, on fait `sudo smbpasswd -a utilisateur` et on se met un mot de passe. A partir de là, le serveur peut être accédé par n'importe qui entrant le nom d'utilisateur et le mot de passe. J'ai donc essayé d'accéder à mon serveur avec mon PC Windows sur le même réseau wifi, et en entrant `\\192.168.1.87` dans l'explorateur de fichiers, il m'a demandé des identifiants, et boum ça marche.
![](https://i.imgur.com/M0ApwkC.png)

## Chiffrement et confiance
On est tous au courant que de nos jours, on utilise la cryptographie par clé publique, très répandu partout dans le monde. Ce système utilise une vérification avec une clé publique et une clé privée. Une fois la clé publique reçue, l'information ne peut être déchiffrée qu'avec la clé privée.
De ce fait, un certificat est un moyen utilisé pour **ditribuer** une clé publique, et les informations qui vont avec, par exemple qui a fait cette clé. Ces certificats peuvent être signés par une autorité certifié, qui a pour rôle de confirmer la véracité des informations contenues dans le certificat. 
Un certificat contient impérativement une clé publique. Dans les métadonnées, nous pouvons avoir la date d'émission du certificat, sa validité, l'entreprise qui a demandé le certificat, l'entreprise qui a émit le certificat, et d'autres champs qui peuvent être remplis ou non.
![](https://i.imgur.com/EgZPm8E.png)
### Chiffrement de mails
N'utilisant absolument aucun client mail, j'ai décidé d'utiliser celui venant avec KDE, et de prendre le plugin de chiffrement de mail qui vient avec, et voilà.
Alors il se trouve que Kmail, et probablement d'autres clients de mail, propose de chiffre les mails avec une clé dès la phase de setup. Très pratique, mais pas ultra intéressant.
![](https://i.imgur.com/zSzTwLl.png)

## SSH
### Serveur
Bon, le SSH c'est pas nouveau, on s'en sert depuis le début de l'année pour nos VM et pour contrôler d'autres machines à distance, je vais pas refaire l'explication de ce que c'est, en tout cas c'est très utile.
Pour se connecter en SSH sur une machine, y a deux manières : soit la machine serveur n'est pas complètement configurée, et on peut s'y connecter en entrant le mot de passe d'un utilisateur présent sur la machine, soit elle est configurée et on ne peut s'y connecter uniquement qu'avec une paire de clés valides.
Là c'est moi qui me connecte à ma VM sous CentOS 7 :
![](https://i.imgur.com/3QkHY2m.png)
Comme c'est la première fois que je me connecte à la machine, il me dit qu'il ne connaît pas l'identité de la machine en face. Logique.
Maintenant, première étape pour sécuriser une connexion SSH, forcer l'utilisation de clé sur la machine distante. Pour se faire, on va d'abord envoyer la clé publique sur le serveur distant avec la commande `ssh-copy-id lemalgache@192.168.56.103`, et bam la clé est envoyée au serveur.
...Problème, il suffit d'utiliser un autre utilisateur sur le compte pour ne plus être dép
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MTM3Nzk4MTgsNzM2ODkyMDY3LC0xMT
I2NjgyMzc2LC0xNzgzNjAwNCwxNDE3NTU4MTI5LDM0MDQ2NTY5
MiwxMjY2Mzk5NDAsLTE1MjA2NjYzNCwxNzQ0MjQyMjA2LC03MT
M4NTM5ODAsLTk0MDE1MzMwMywxODYwNDQ1NTY0LDIwNzY5NTYw
MzMsLTIxMjA0MzAyNTMsODQwMTg4NTM1LDc4MTgwOTc4NCwtOD
YyNjc0Nzc4LC0xMzY0OTQ4MzMyLC0xNjQyNzA0OCwtMTcyMjU0
MjY4M119
-->