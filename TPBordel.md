# Sujet 1 : Ecrire de l'assembleur
### Le XOR
On va créer un Xor avec notre petit émulateur 8086.

# Sujet 4 : Analyse de boot
### Exo 1
On va voir quels processus se lancent au démarrage, et quels sont les plus longs à démarrer. 
On utilise la commande pratique `systemd-analyze plot > graphe.svg` et ça donne ça :
![](https://i.imgur.com/cx0ls9f.png)
Evidemment, la liste est giga longue donc j'ai pas tout mis, mais on a tous les processus de lancement. Ceux qui mettent le plus longtemps à se lancer dans le systemd sont ceux qui sont le plus en rouge, en "activating". Les 5 les plus longs à se lancer sont : Network-Manager, light-dm, systemd-logind, systemd-random-seed et lvm2-monitor-service.
### Exo 2
Après avoir fait la commande `dmesg`, j'ai fait un `grep device` pour voir la liste des périphériques.
```
❯ sudo dmesg | grep device
[    0.034093] [mem 0x90000000-0xefffffff] available for PCI devices
[    0.074908] Console: colour dummy device 80x25
[    0.558364] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.558364] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.558637] usbcore: registered new device driver usb
[    0.589886] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.590072] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.590173] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.590305] pnp 00:03: Plug and Play ACPI device, IDs ATK3001 PNP030b (active)
[    0.590490] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.590687] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.590945] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.591873] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.592750] pnp: PnP ACPI: found 8 devices
[    0.598752] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.705475] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.717554] fb0: EFI VGA frame buffer device
[    0.718030] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:19/PNP0C09:01/PNP0C0D:00/input/input0
[    0.718112] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    0.718152] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    0.726195] ahci 0000:00:17.0: enabling device (0000 -> 0003)
[    1.191102] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.06
[    1.191104] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.192548] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.06
[    1.192549] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.215444] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    1.525312] usb 1-2: new full-speed USB device number 2 using xhci_hcd
[    1.667610] usb 1-2: New USB device found, idVendor=062a, idProduct=5918, bcdDevice= 1.02
[    1.667611] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.700598] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    1.709508] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    1.775182] ipmi device interface
[    1.791954] usb 1-5: new high-speed USB device number 3 using xhci_hcd
[    1.939351] nvidia-nvlink: Nvlink Core is being initialized, major device number 242
[    1.982734] usb 1-5: New USB device found, idVendor=13d3, idProduct=56cb, bcdDevice=18.61
[    1.982736] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    2.111949] usb 1-10: new full-speed USB device number 4 using xhci_hcd
[    2.252865] usb 1-10: New USB device found, idVendor=8087, idProduct=0aaa, bcdDevice= 0.02
[    2.252869] usb 1-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.298504] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    2.301385] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    2.313300] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    2.322706] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    2.345842] intel-lpss 0000:00:19.0: enabling device (0000 -> 0002)
[    2.469838] input: PC Speaker as /devices/platform/pcspkr/input/input4
[    2.685643] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    2.740086] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
[    2.740372] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:22/LNXVIDEO:01/input/input6
[    2.752002] fbcon: i915drmfb (fb0) is primary device
[    2.752007] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    2.825668] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    2.985104] input: GDX1505:00 27C6:01F1 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-GDX1505:00/0018:27C6:01F1.0001/input/input7
[    2.985836] input: GDX1505:00 27C6:01F1 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-GDX1505:00/0018:27C6:01F1.0001/input/input8
[    3.123073] iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[    3.209750] input: Asus WMI hotkeys as /devices/platform/asus-nb-wmi/input/input10
[    3.303215] input: GDX1505:00 27C6:01F1 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-GDX1505:00/0018:27C6:01F1.0001/input/input11
[    3.303350] input: GDX1505:00 27C6:01F1 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-GDX1505:00/0018:27C6:01F1.0001/input/input12
[    3.351778] mousedev: PS/2 mouse device common for all mice
[    3.550926] input: HDA Intel PCH Headset Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    3.550988] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
[    3.551046] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    3.551104] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
[    3.551159] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
[    3.551213] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
[    3.551272] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
[    3.785208] input: MOSART Semi. 2.4G Keyboard Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:062A:5918.0002/input/input21
[    3.841799] input: MOSART Semi. 2.4G Keyboard Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:062A:5918.0003/input/input22
[    3.842170] input: MOSART Semi. 2.4G Keyboard Mouse Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:062A:5918.0003/input/input23
[    3.898893] input: MOSART Semi. 2.4G Keyboard Mouse System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:062A:5918.0003/input/input24
[    3.898995] input: MOSART Semi. 2.4G Keyboard Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:062A:5918.0003/input/input25
[    4.000460] Bluetooth: HCI device and connection manager initialized
[    4.031012] uvcvideo: Found UVC 1.50 device USB2.0 HD IR UVC WebCam (13d3:56cb)
[    4.036387] input: USB2.0 HD IR UVC WebCam: USB2.0 as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input26
[    4.037577] uvcvideo: Found UVC 1.50 device USB2.0 HD IR UVC WebCam (13d3:56cb)
[    4.039966] input: USB2.0 HD IR UVC WebCam: USB2.0 as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/input/input27
[  988.778526] usb 1-5: reset high-speed USB device number 3 using xhci_hcd
[  989.035159] snd_hda_intel 0000:02:00.1: enabling device (0000 -> 0002)
[  989.052312] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.4/0000:02:00.1/sound/card1/input28
[  989.052386] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.4/0000:02:00.1/sound/card1/input29
[  989.052455] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.4/0000:02:00.1/sound/card1/input30
[  989.052530] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.4/0000:02:00.1/sound/card1/input31
```
L'ordre des périphériques remontés va comme suit : Périphériques PCI > USB > Entrées. Pour trouver la version du kernel, on tape `dmesg 
| grep Linux`, car un grep kernel ne trouve rien étonnamment.
```
❯ sudo dmesg | grep Linux
[    0.000000] Linux version 5.6.15-1-MANJARO (builder@601a6c674820) (gcc version 10.1.0 (GCC)) #1 SMP PREEMPT Wed May 27 20:38:56 UTC 2020
[    0.445324] ACPI: Added _OSI(Linux-Dell-Video)
[    0.445324] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.445325] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.558647] pps_core: LinuxPPS API ver. 1 registered
[    1.191107] usb usb1: Manufacturer: Linux 5.6.15-1-MANJARO xhci-hcd
[    1.192551] usb usb2: Manufacturer: Linux 5.6.15-1-MANJARO xhci-hcd
[    2.055311] Linux agpgart interface v0.103
[    2.685557] Intel(R) Wireless WiFi driver for Linux
[    3.838296] mc: Linux media interface: v0.10
[    3.895424] videodev: Linux video capture interface: v2.00

```
J'ai une distrib Manjaro, j'ai donc un kernel basé sur Linux 5.6.15.
Y a genre beaucoup trop de lignes dans les logs de boot kernel, mais on peut en sortir quelques unes importantes : 

Le kernel continue à générer des logs en permanence. On peut utiliser la commande `dmesg --follow` pour avoir les updates en live. Et même, en faisant un `dmesg -T`, on peut avoir le timestamp, et on peut donc observer que les log

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTEwNzExMTQ5LC0xODE1ODM0Mjg1LC0zNj
YwMTY0MTEsLTU3NTc3NzAyNCwtOTY2MDUzOTM2LDc3NzAzODI2
MiwxMjkzMjIzMTYsNDQ3ODUzODU3LDk5NDc5NDkwOCwtMTMxND
M0NDkwMSw4OTk2NDg2MCwtMzMyNDU1MzYzXX0=
-->