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

Ports en utilisation

### Users
### Processus
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
Le script est très simple, 
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTMyOTE5NTAwNywtMTEzNDc0MTY2NiwtMj
A2ODI5MTQ1MSwtMzQwOTY5NDYwLC0xMTgwNDc4MzQ0LC0yMTI0
MDAzMjY0XX0=
-->