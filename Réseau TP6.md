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
Comme ça on a les infos de la mémoire en temps réel.
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
lscpu  ✔   
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

```bash
sudo fdisk -l  ✔   
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTQ2MTE1OTA3MiwtMTM1NDQ4NjI4NiwtOT
M2MTkzMzgsMTMwMTM4MzgwOSwtOTE1NDAyMzE5LC0xNjk2OTIx
NTMzLDEyOTg3OTUxMTgsLTE3NjMwNDg1MzMsLTIwODg3NDY2MT
JdfQ==
-->