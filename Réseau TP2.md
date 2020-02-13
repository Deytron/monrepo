---


---

<h1 id="tp-2---machine-virtuelle-réseau-serveurs-routage-simple">TP 2 - Machine virtuelle, réseau, serveurs, routage simple</h1>
<h3 id="configuration-réseau-dune-machine-centos">4. Configuration réseau d’une machine CentOS</h3>
<p>Liste des cartes réseau</p>

<table>
<thead>
<tr>
<th>Name</th>
<th>IP</th>
<th>MAC</th>
<th>Fonction</th>
</tr>
</thead>
<tbody>
<tr>
<td>lo</td>
<td>127.0.0.1</td>
<td>00:00:00:00:00:00</td>
<td>Carte de loopback</td>
</tr>
<tr>
<td>enp0s3</td>
<td>10.0.2.15</td>
<td>08:00:27:db:61:76</td>
<td>Carte réseau NAT</td>
</tr>
<tr>
<td>enp0s8</td>
<td>10.2.1.2</td>
<td>08:00:27:86:f1:fb</td>
<td>Carte réseau privé hôte</td>
</tr>
</tbody>
</table><p>On va changer l’IP de la carte réseau hôte</p>
<p>IP initiale : 10.2.1.4</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token punctuation">[</span>root@localhost ~<span class="token punctuation">]</span><span class="token comment"># ip a</span>
1: lo: <span class="token operator">&lt;</span>LOOPBACK,UP,LOWER_UP<span class="token operator">&gt;</span> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <span class="token operator">&lt;</span>BROADCAST,MULTICAST,UP,LOWER_UP<span class="token operator">&gt;</span> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:db:61:76 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic enp0s3
       valid_lft 86101sec preferred_lft 86101sec
    inet6 fe80::f39d:8127:1f12:abfd/64 scope <span class="token function">link</span> noprefixroute
       valid_lft forever preferred_lft forever
3: enp0s8: <span class="token operator">&lt;</span>BROADCAST,MULTICAST,UP,LOWER_UP<span class="token operator">&gt;</span> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:86:f1:fb brd ff:ff:ff:ff:ff:ff
    inet 10.2.1.4/24 brd 10.2.1.255 scope global noprefixroute enp0s8
       valid_lft forever preferred_lft forever
    inet6 fe80::c87c:9447:9db2:38f9/64 scope <span class="token function">link</span> noprefixroute
       valid_lft forever preferred_lft forever
</code></pre>
<p>Pour changer l’IP, on se rend dans <code>cd /etc/sysconfig/network-scripts</code><br>
Pour changer l’IP de la carte réseau hôte, on va modifier via vim le fichier <code>ifcfg-enp0s8</code> et changer l’adresse à la ligne <code>IPADDR="10.2.1.4"</code>. On va la changer en <code>IPADDR="10.2.1.5"</code>.</p>
<p>On fait un  <code>service network restart</code> pour redémarrer le service réseau et boum l’IP est changée</p>
<pre class=" language-bash"><code class="prism  language-bash">3: enp0s8: <span class="token operator">&lt;</span>BROADCAST,MULTICAST,UP,LOWER_UP<span class="token operator">&gt;</span> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:86:f1:fb brd ff:ff:ff:ff:ff:ff
    inet 10.2.1.5/24 brd 10.2.1.255 scope global noprefixroute enp0s8
       valid_lft forever preferred_lft forever
    inet6 fe80::c87c:9447:9db2:38f9/64 scope <span class="token function">link</span> noprefixroute
       valid_lft forever preferred_lft forever
</code></pre>
<p>On test un ping</p>
<pre class=" language-powershell"><code class="prism  language-powershell"><span class="token function">PS</span> C:\Windows\system32&gt; ping 10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5

Envoi d’une requête <span class="token string">'Ping'</span>  10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5 avec 32 octets de données :
Réponse de 10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5 : octets=32 temps&lt;1ms TTL=64
Réponse de 10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5 : octets=32 temps=1 ms TTL=64
Réponse de 10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5 : octets=32 temps&lt;1ms TTL=64
Réponse de 10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5 : octets=32 temps&lt;1ms TTL=64

Statistiques Ping pour 10<span class="token punctuation">.</span>2<span class="token punctuation">.</span>1<span class="token punctuation">.</span>5:
   Paquets : envoyés = 4<span class="token punctuation">,</span> reçus = 4<span class="token punctuation">,</span> perdus = 0 <span class="token punctuation">(</span>perte 0<span class="token operator">%</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
Durée approximative des boucles en millisecondes :
   Minimum = 0ms<span class="token punctuation">,</span> Maximum = 1ms<span class="token punctuation">,</span> Moyenne = 0ms
</code></pre>
<h3 id="appréhension-de-quelques-commandes">5. Appréhension de quelques commandes</h3>
<p>On lance un petit scan</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token punctuation">[</span>root@localhost ~<span class="token punctuation">]</span><span class="token comment">#  nmap -A 10.2.1.5</span>

Starting Nmap 6.40 <span class="token punctuation">(</span> http://nmap.org <span class="token punctuation">)</span> at 2020-02-13 15:40 CET
Nmap scan report <span class="token keyword">for</span> 10.2.1.5
Host is up <span class="token punctuation">(</span>0.00015s latency<span class="token punctuation">)</span>.
Not shown: 999 closed ports
PORT   STATE SERVICE VERSION
22/tcp <span class="token function">open</span>  <span class="token function">ssh</span>     OpenSSH 7.4 <span class="token punctuation">(</span>protocol 2.0<span class="token punctuation">)</span>
<span class="token operator">|</span> ssh-hostkey: 2048 d6:21:5e:21:1e:ac:14:bd:0f:b7:2e:0a:1e:c8:8c:a9 <span class="token punctuation">(</span>RSA<span class="token punctuation">)</span>
<span class="token operator">|</span>_256 8b:a3:1d:26:60:10:ab:e1:6e:9b:2e:bb:67:e7:66:43 <span class="token punctuation">(</span>ECDSA<span class="token punctuation">)</span>
Device type: general purpose
Running: Linux 3.X
OS CPE: cpe:/o:linux:linux_kernel:3
OS details: Linux 3.7 - 3.9
Network Distance: 0 hops

OS and Service detection performed. Please report any incorrect results at http://nmap.org/submit/ <span class="token keyword">.</span>
Nmap done: 1 IP address <span class="token punctuation">(</span>1 host up<span class="token punctuation">)</span> scanned <span class="token keyword">in</span> 2.97 seconds
</code></pre>
<p>On scanne les ports TCP/UDP en écoute</p>
<pre class=" language-powershell"><code class="prism  language-powershell"><span class="token namespace">[root@localhost ~]</span><span class="token comment"># ss -ltunp</span>
Netid  State      Recv<span class="token operator">-</span>Q Send<span class="token operator">-</span>Q                              
udp    UNCONN     0      0                                                <span class="token operator">*</span>:68                                                           <span class="token operator">*</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"dhclient"</span><span class="token punctuation">,</span>pid=3193<span class="token punctuation">,</span>fd=6<span class="token punctuation">)</span><span class="token punctuation">)</span>
udp    UNCONN     0      0                                        127<span class="token punctuation">.</span>0<span class="token punctuation">.</span>0<span class="token punctuation">.</span>1:323                                                          <span class="token operator">*</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"chronyd"</span><span class="token punctuation">,</span>pid=795<span class="token punctuation">,</span>fd=5<span class="token punctuation">)</span><span class="token punctuation">)</span>
udp    UNCONN     0      0                                            <span class="token punctuation">[</span>::1<span class="token punctuation">]</span>:323                                                       <span class="token punctuation">[</span>::<span class="token punctuation">]</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"chronyd"</span><span class="token punctuation">,</span>pid=795<span class="token punctuation">,</span>fd=6<span class="token punctuation">)</span><span class="token punctuation">)</span>
tcp    LISTEN     0      100                                      127<span class="token punctuation">.</span>0<span class="token punctuation">.</span>0<span class="token punctuation">.</span>1:25                                                           <span class="token operator">*</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"master"</span><span class="token punctuation">,</span>pid=1540<span class="token punctuation">,</span>fd=13<span class="token punctuation">)</span><span class="token punctuation">)</span>
tcp    LISTEN     0      128                                              <span class="token operator">*</span>:22                                                           <span class="token operator">*</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"sshd"</span><span class="token punctuation">,</span>pid=1215<span class="token punctuation">,</span>fd=3<span class="token punctuation">)</span><span class="token punctuation">)</span>
tcp    LISTEN     0      100                                          <span class="token punctuation">[</span>::1<span class="token punctuation">]</span>:25                                                        <span class="token punctuation">[</span>::<span class="token punctuation">]</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"master"</span><span class="token punctuation">,</span>pid=1540<span class="token punctuation">,</span>fd=14<span class="token punctuation">)</span><span class="token punctuation">)</span>
tcp    LISTEN     0      128                                           <span class="token punctuation">[</span>::<span class="token punctuation">]</span>:22                                                        <span class="token punctuation">[</span>::<span class="token punctuation">]</span>:<span class="token operator">*</span>                   users:<span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token string">"sshd"</span><span class="token punctuation">,</span>pid=1215<span class="token punctuation">,</span>fd=4<span class="token punctuation">)</span><span class="token punctuation">)</span>
</code></pre>
<p>On peut check quel programme envoie/reçoit des données grâce au PID, pour afficher les PID sur Linux on utilise la commande <code>ps -A</code>.</p>
<pre class=" language-powershell"><code class="prism  language-powershell"><span class="token namespace">[root@localhost ~]</span><span class="token comment"># ps -A</span>
  PID TTY          TIME CMD
    1 ?        00:00:01 systemd
    2 ?        00:00:00 kthreadd
    4 ?        00:00:00 kworker<span class="token operator">/</span>0:0H
    6 ?        00:00:00 ksoftirqd<span class="token operator">/</span>0
    7 ?        00:00:00 migration<span class="token operator">/</span>0
    8 ?        00:00:00 rcu_bh
    9 ?        00:00:01 rcu_sched
   10 ?        00:00:00 lru<span class="token operator">-</span>add<span class="token operator">-</span>drain
   11 ?        00:00:00 watchdog<span class="token operator">/</span>0
   12 ?        00:00:00 watchdog<span class="token operator">/</span>1
   13 ?        00:00:00 migration<span class="token operator">/</span>1
   14 ?        00:00:00 ksoftirqd<span class="token operator">/</span>1
   16 ?        00:00:00 kworker<span class="token operator">/</span>1:0H
   17 ?        00:00:00 watchdog<span class="token operator">/</span>2
   18 ?        00:00:00 migration<span class="token operator">/</span>2
   19 ?        00:00:00 ksoftirqd<span class="token operator">/</span>2
   20 ?        00:00:00 kworker<span class="token operator">/</span>2:0
   21 ?        00:00:00 kworker<span class="token operator">/</span>2:0H
   22 ?        00:00:00 watchdog<span class="token operator">/</span>3
   23 ?        00:00:00 migration<span class="token operator">/</span>3
   24 ?        00:00:00 ksoftirqd<span class="token operator">/</span>3
   26 ?        00:00:00 kworker<span class="token operator">/</span>3:0H
   28 ?        00:00:00 kdevtmpfs
   29 ?        00:00:00 netns
   30 ?        00:00:00 khungtaskd
   31 ?        00:00:00 writeback
   32 ?        00:00:00 kintegrityd
   33 ?        00:00:00 bioset
   34 ?        00:00:00 bioset
   35 ?        00:00:00 bioset
   36 ?        00:00:00 kblockd
   37 ?        00:00:00 md
   38 ?        00:00:00 edac<span class="token operator">-</span>poller
   39 ?        00:00:00 watchdogd
   45 ?        00:00:00 kswapd0
   46 ?        00:00:00 ksmd
   47 ?        00:00:00 khugepaged
   48 ?        00:00:00 crypto
   56 ?        00:00:00 kthrotld
   57 ?        00:00:00 kworker<span class="token operator">/</span>u8:1
   58 ?        00:00:00 kmpath_rdacd
   59 ?        00:00:00 kaluad
   60 ?        00:00:00 kpsmoused
   61 ?        00:00:00 ipv6_addrconf
   62 ?        00:00:06 kworker<span class="token operator">/</span>0:2
   75 ?        00:00:00 deferwq
   76 ?        00:00:00 kworker<span class="token operator">/</span>3:1
  113 ?        00:00:00 kauditd
  297 ?        00:00:00 ata_sff
  308 ?        00:00:00 scsi_eh_0
  320 ?        00:00:00 scsi_tmf_0
  341 ?        00:00:00 scsi_eh_1
  343 ?        00:00:00 scsi_tmf_1
  345 ?        00:00:00 kworker<span class="token operator">/</span>u8:2
  359 ?        00:00:00 scsi_eh_2
  360 ?        00:00:00 scsi_tmf_2
  361 ?        00:00:00 irq<span class="token operator">/</span>18<span class="token operator">-</span>vmwgfx
  362 ?        00:00:00 ttm_swap
  374 ?        00:00:00 kworker<span class="token operator">/</span>3:1H
  439 ?        00:00:00 kdmflush
  440 ?        00:00:00 bioset
  451 ?        00:00:00 kdmflush
  452 ?        00:00:00 bioset
  464 ?        00:00:00 bioset
  465 ?        00:00:00 xfsalloc
  466 ?        00:00:00 xfs_mru_cache
  467 ?        00:00:00 xfs<span class="token operator">-</span>buf<span class="token operator">/</span>dm<span class="token operator">-</span>0
  468 ?        00:00:00 xfs<span class="token operator">-</span><span class="token keyword">data</span><span class="token operator">/</span>dm<span class="token operator">-</span>0
  469 ?        00:00:00 xfs<span class="token operator">-</span>conv<span class="token operator">/</span>dm<span class="token operator">-</span>0
  470 ?        00:00:00 xfs<span class="token operator">-</span>cil<span class="token operator">/</span>dm<span class="token operator">-</span>0
  471 ?        00:00:00 xfs<span class="token operator">-</span>reclaim<span class="token operator">/</span>dm<span class="token operator">-</span>
  472 ?        00:00:00 xfs<span class="token operator">-</span>log<span class="token operator">/</span>dm<span class="token operator">-</span>0
  473 ?        00:00:00 xfs<span class="token operator">-</span>eofblocks<span class="token operator">/</span>d
  474 ?        00:00:00 xfsaild<span class="token operator">/</span>dm<span class="token operator">-</span>0
  475 ?        00:00:00 kworker<span class="token operator">/</span>0:1H
  555 ?        00:00:00 systemd<span class="token operator">-</span>journal
  564 ?        00:00:00 kworker<span class="token operator">/</span>3:2
  577 ?        00:00:00 lvmetad
  591 ?        00:00:00 systemd<span class="token operator">-</span>udevd
  724 ?        00:00:00 xfs<span class="token operator">-</span>buf<span class="token operator">/</span>sda1
  725 ?        00:00:00 xfs<span class="token operator">-</span><span class="token keyword">data</span><span class="token operator">/</span>sda1
  726 ?        00:00:00 xfs<span class="token operator">-</span>conv<span class="token operator">/</span>sda1
  729 ?        00:00:00 kworker<span class="token operator">/</span>2:2
  731 ?        00:00:00 xfs<span class="token operator">-</span>cil<span class="token operator">/</span>sda1
  732 ?        00:00:00 xfs<span class="token operator">-</span>reclaim<span class="token operator">/</span>sda
  733 ?        00:00:00 xfs<span class="token operator">-</span>log<span class="token operator">/</span>sda1
  734 ?        00:00:00 xfs<span class="token operator">-</span>eofblocks<span class="token operator">/</span>s
  735 ?        00:00:00 xfsaild<span class="token operator">/</span>sda1
  763 ?        00:00:00 auditd
  785 ?        00:00:00 systemd<span class="token operator">-</span>logind
  786 ?        00:00:00 irqbalance
  789 ?        00:00:00 polkitd
  791 ?        00:00:00 dbus<span class="token operator">-</span>daemon
  795 ?        00:00:00 chronyd
  808 ?        00:00:00 crond
  815 ?        00:00:00 firewalld
  819 ?        00:00:00 login
  821 ?        00:00:00 NetworkManager
  974 ?        00:00:00 kworker<span class="token operator">/</span>2:1H
  975 ?        00:00:00 kworker<span class="token operator">/</span>1:1H
 1215 ?        00:00:00 sshd
 1216 ?        00:00:01 tuned
 1217 ?        00:00:00 rsyslogd
 1540 ?        00:00:00 master
 1541 ?        00:00:00 pickup
 1542 ?        00:00:00 qmgr
 1724 tty1     00:00:00 bash
 2819 ?        00:00:00 kworker<span class="token operator">/</span>0:0
 3193 ?        00:00:00 dhclient
 3415 ?        00:00:00 kworker<span class="token operator">/</span>1:1
 3422 ?        00:00:00 sshd
 3426 pts<span class="token operator">/</span>0    00:00:00 bash
 3458 ?        00:00:00 kworker<span class="token operator">/</span>1:0
 3520 ?        00:00:00 kworker<span class="token operator">/</span>1:2
 3524 pts<span class="token operator">/</span>0    00:00:00 <span class="token function">ps</span>
</code></pre>
<p>Ici par exemple,</p>

