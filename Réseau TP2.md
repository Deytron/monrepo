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
<p>On fait un  <code>service network restart</code> pour redémarrer le service réseau et boum</p>
<pre class=" language-bash"><code class="prism  language-bash">3: enp0s8: <span class="token operator">&lt;</span>BROADCAST,MULTICAST,UP,LOWER_UP<span class="token operator">&gt;</span> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:86:f1:fb brd ff:ff:ff:ff:ff:ff
    inet 10.2.1.5/24 brd 10.2.1.255 scope global noprefixroute enp0s8
       valid_lft forever preferred_lft forever
    inet6 fe80::c87c:9447:9db2:38f9/64 scope <span class="token function">link</span> noprefixroute
       valid_lft forever preferred_lft forever
</code></pre>

