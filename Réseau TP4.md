---


---

<h1 id="i.-topologie-1--simple">I. Topologie 1 : simple</h1>
<h3 id="mise-en-place">2. Mise en place</h3>
<h4 id="a.-topologie-gns3">A. Topologie GNS3</h4>
<p><img src="https://i.imgur.com/vStbWYa.png" alt=""></p>
<p>Ici le setup de base. Tout va bien, la VM CentOS est à gauche, le VPC à droite, le routeur Cisco en haut.<br>
Il faut qu’on paramètre les IP des PC selon le tableau d’adressage. J’ai donc modifié le fichier <code>ifcfg-enp0s9</code> de ma VM CentOS 7, et utilisé la commande <code>ip 10.4.2.11</code> dans la console du VPC.<br>
J’ai aussi pensé à changer le hostname d’admin1.</p>
<p>J’ai ensuite paramétré le routeur Cisco. J’ai utilisé dans l’ordre <code>conf t</code>, <code>interface fastEthernet 0/0</code>(Pour le VPCS), <code>ip address 10.4.2.254 255.255.255.0</code>, puis <code>no shut</code> pour l’activer. Même chose avec <code>fastEthernet 1/0</code>(Pour l’admin1) et <code>ip address 10.4.1.254 255.255.255.0</code> et <code>no shut</code>.</p>
<p>On teste, les ping fonctionnent , le routeur peut rejoindre les deux machines :</p>
<pre class=" language-bash"><code class="prism  language-bash">R1<span class="token comment">#ping 10.4.2.11  </span>
  
Type escape sequence to abort.  
Sending 5, 100-byte ICMP Echos to 10.4.2.11, <span class="token function">timeout</span> is 2 seconds:  
<span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span>  
Success rate is 100 percent <span class="token punctuation">(</span>5/5<span class="token punctuation">)</span>, round-trip min/avg/max <span class="token operator">=</span> 36/36/40 ms  
R1<span class="token comment">#ping 10.4.1.11  </span>
  
Type escape sequence to abort.  
Sending 5, 100-byte ICMP Echos to 10.4.1.11, <span class="token function">timeout</span> is 2 seconds:  
<span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span>  
Success rate is 100 percent <span class="token punctuation">(</span>5/5<span class="token punctuation">)</span>, round-trip min/avg/max <span class="token operator">=</span> 36/42/52 ms
</code></pre>
<p>Ping <code>guest1</code> vers <code>R1</code> :</p>
<pre class=" language-bash"><code class="prism  language-bash">guest1<span class="token operator">&gt;</span> <span class="token function">ping</span> 10.4.2.254  
84 bytes from 10.4.2.254 icmp_seq<span class="token operator">=</span>1 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>8.670 ms  
84 bytes from 10.4.2.254 icmp_seq<span class="token operator">=</span>2 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>1.344 ms  
84 bytes from 10.4.2.254 icmp_seq<span class="token operator">=</span>3 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>22.398 ms  
84 bytes from 10.4.2.254 icmp_seq<span class="token operator">=</span>4 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>10.707 ms
</code></pre>
<p>Ping <code>admin1</code> vers <code>R1</code> : (oui j’arrive pas à SSH mon admin1)<br>
<img src="https://i.imgur.com/rvP351H.png" alt=""></p>
<p>Table ARP du <code>routeur</code> :</p>
<pre class=" language-bash"><code class="prism  language-bash">R1<span class="token comment">#show arp  </span>
Protocol Address Age <span class="token punctuation">(</span>min<span class="token punctuation">)</span> Hardware Addr Type Interface  
Internet 10.4.1.11 1 0800.27ef.6404 ARPA FastEthernet1/0  
Internet 10.4.2.11 1 0050.7966.6800 ARPA FastEthernet0/0
</code></pre>
<p>MACs :</p>
<pre class=" language-bash"><code class="prism  language-bash">guest1<span class="token operator">&gt;</span> show ip
MAC <span class="token keyword">:</span> 00:50:79:66:68:00
</code></pre>
<p><code>admin1</code> :<br>
<img src="https://i.imgur.com/iZpRAaj.png" alt=""></p>
<p>On est bon sisi.</p>
<h3 id="c.-routage">C. Routage</h3>
<p>On ajoute une route pour pouvoir pinger le réseau guests. Comme d’hab, on crée un fichier <code>route-enp0s8</code> où on y inscrit ceci :<br>
<code>10.4.2.0/24 via 10.4.2.254 dev enp0s8</code></p>
<p>Après un ifdown/ifup, on teste de ping <code>guest1</code> :<br>
<img src="https://i.imgur.com/kWTsoco.png" alt=""></p>
<p>Pour le VPCS, on rajoute une passerelle par défaut en l’ajoutant à la commande d’ajout d’IP. Soit <code>ip 10.4.1.11 /24 10.4.1.254</code>. Et on teste le ping :</p>
<pre class=" language-bash"><code class="prism  language-bash">guest1<span class="token operator">&gt;</span> <span class="token function">ping</span> 10.4.1.11  
84 bytes from 10.4.1.11 icmp_seq<span class="token operator">=</span>1 ttl<span class="token operator">=</span>63 time<span class="token operator">=</span>21.573 ms  
84 bytes from 10.4.1.11 icmp_seq<span class="token operator">=</span>2 ttl<span class="token operator">=</span>63 time<span class="token operator">=</span>21.855 ms
</code></pre>
<p>On vérifie que les paquets passent bien par le routeur avec un <code>trace</code> :</p>
<pre class=" language-bash"><code class="prism  language-bash">guest1<span class="token operator">&gt;</span> trace 10.4.1.11  
trace to 10.4.1.11, 8 hops max, press Ctrl+C to stop  
1 10.4.2.254 9.476 ms 12.243 ms 10.711 ms  
2 *10.4.1.11 27.277 ms <span class="token punctuation">(</span>ICMP type:3, code:10, Host administratively prohibited<span class="token punctuation">)</span>
</code></pre>
<h2 id="iii.-topologie-3--adding-nodes-and-nat">III. Topologie 3 : adding nodes and NAT</h2>
<h3 id="mise-en-place-1">2. Mise en place</h3>
<h3 id="a.-topologie-gns3-1">A. Topologie GNS3</h3>
<p>On fait la topologie oklm</p>
<p><img src="https://i.imgur.com/XnsUtVB.png" alt=""><br>
On refait tout le paramétrage, mais sur chaque machine.<br>
Pour les guest 1,2 et 3, on met l’IP et le gateway avec <code>10.4.2.(11,12,13) /24 10.4.2.254</code> et boum, c’est fait, les machines peuvent communiquer entre elles (le switch se charge de ça).<br>
Pour l’admin1, on garde tout pareil ça change pas, et pour le routeur, on remet les interfaces 0/0 et 1/0. Une fois ceci fait, toutes les machines peuvent se ping entre elles (la NAT n’étant pas encore configurée, pas d’accès internet)<br>
Ping de <code>guest3</code> vers <code>guest2</code> :</p>
<pre class=" language-bash"><code class="prism  language-bash">guest3<span class="token operator">&gt;</span> <span class="token function">ping</span> 10.4.2.12  
84 bytes from 10.4.2.12 icmp_seq<span class="token operator">=</span>1 ttl<span class="token operator">=</span>64 time<span class="token operator">=</span>0.656 ms  
84 bytes from 10.4.2.12 icmp_seq<span class="token operator">=</span>2 ttl<span class="token operator">=</span>64 time<span class="token operator">=</span>0.436 ms  
84 bytes from 10.4.2.12 icmp_seq<span class="token operator">=</span>3 ttl<span class="token operator">=</span>64 time<span class="token operator">=</span>0.845 ms  
84 bytes from 10.4.2.12 icmp_seq<span class="token operator">=</span>4 ttl<span class="token operator">=</span>64 time<span class="token operator">=</span>1.532 ms
</code></pre>
<p>Ping de guest2 vers <code>admin1</code>:</p>
<pre class=" language-bash"><code class="prism  language-bash">guest2<span class="token operator">&gt;</span> <span class="token function">ping</span> 10.4.1.11  
84 bytes from 10.4.1.11 icmp_seq<span class="token operator">=</span>1 ttl<span class="token operator">=</span>63 time<span class="token operator">=</span>19.685 ms  
84 bytes from 10.4.1.11 icmp_seq<span class="token operator">=</span>2 ttl<span class="token operator">=</span>63 time<span class="token operator">=</span>19.026 ms  
84 bytes from 10.4.1.11 icmp_seq<span class="token operator">=</span>3 ttl<span class="token operator">=</span>63 time<span class="token operator">=</span>17.701 ms  
84 bytes from 10.4.1.11 icmp_seq<span class="token operator">=</span>4 ttl<span class="token operator">=</span>63 time<span class="token operator">=</span>17.568 ms
</code></pre>
<p>Les guests peuvent pinger le réseau Admins :</p>
<pre class=" language-bash"><code class="prism  language-bash">guest2<span class="token operator">&gt;</span> <span class="token function">ping</span> 10.4.1.254  
84 bytes from 10.4.1.254 icmp_seq<span class="token operator">=</span>1 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>2.876 ms  
84 bytes from 10.4.1.254 icmp_seq<span class="token operator">=</span>2 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>10.023 ms  
84 bytes from 10.4.1.254 icmp_seq<span class="token operator">=</span>3 ttl<span class="token operator">=</span>255 time<span class="token operator">=</span>8.366 ms
</code></pre>
<h3 id="c.-accès-wan"><a href="#c-acc%C3%A8s-wan"></a>C. Accès WAN</h3>
<p>On file un accès WAN au routeur en réglant une interface sur la NAT (ici 2/0) et, au lieu de définir une IP avec <code>ip address XXX</code>, on fait <code>ip address dhcp</code>. C’est dans le tuto. Mais c’est pas encore fini.<br>
Il faut configurer la NAT sur le routeur. Pour ça, encore dans le tuto, on définit d’abord les interfaces internes et externes. Les interfaces externes, ce sont celles qui sont connectées à la NAT (soit uniquement 2/0), les autres c’est les LAN (soit 0/0 et 1/0).<br>
On utilise <code>ip nat outside</code> pour marquer comme externe notre interface 2/0<br>
On fait <code>ip nat inside</code> pour nos interfaces Admins et guests, 1/0 et 0/0.</p>
<p>Après, on autorise le traffic sur l’interface 2/0 avec <code>access-list 1 permit any</code> et on active la NAT avec <code>ip nat inside source list 1 interface fastEthernet 0/0 overload</code>. Et bim. On a bien une IP donnée via DHCP.</p>
<pre class=" language-bash"><code class="prism  language-bash">R1<span class="token comment">#show ip int br  </span>
Interface IP-Address OK? Method Status Protocol  
FastEthernet0/0 10.4.2.254 YES NVRAM up up  
FastEthernet1/0 10.4.1.254 YES NVRAM up up  
FastEthernet2/0 192.168.122.103 YES DHCP up up  
FastEthernet3/0 unassigned YES NVRAM administratively down down  
NVI0 unassigned NO unset up up
</code></pre>
<p>On va maintenant configurer le DNS de nos machines. Simple, trop simple. Pour les guests, on fait <code>ip dns 1.1.1.1</code>. Pour la machine <code>admin1</code>, on modifie le fichier dans <code>/etc/resolv.conf</code> et on y met <code>nameserver 1.1.1.1</code><br>
(Bon en vrai ça y est déjà de base).<br>
Pour le routeur, le DNS devrait déjà être activé de base. Au cas où, j’ai quand même fait un <code>ip domain-lookup</code> pour l’activer.</p>
<p>On teste, et boum le routeur a un accès internet :</p>
<pre class=" language-bash"><code class="prism  language-bash">R1<span class="token comment">#ping pornhub.com  </span>
  
Translating <span class="token string">"pornhub.com"</span><span class="token punctuation">..</span>.domain server <span class="token punctuation">(</span>192.168.122.1<span class="token punctuation">)</span> <span class="token punctuation">[</span>OK<span class="token punctuation">]</span>  
  
Type escape sequence to abort.  
Sending 5, 100-byte ICMP Echos to 66.254.114.41, <span class="token function">timeout</span> is 2 seconds:  
<span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span><span class="token operator">!</span>  
Success rate is 100 percent <span class="token punctuation">(</span>5/5<span class="token punctuation">)</span>, round-trip min/avg/max <span class="token operator">=</span> 16/31/40 ms
</code></pre>
<p>Ok, le routeur va sur internet, mais pas nos PC en local. Il manque un protocole qu’on doit activer.<br>
Toujours dans le tuto, on va activer l’OSPF et faire en sorte que notre serveur réponde en tant que 1.1.1.1 (puisque le DNS qu’on a mis sur nos machine). Pour ça, on fait les commandes <code>router ospf 1</code> pour activer l’OSPF, puis <code>router-id 1.1.1.1</code>, et enfin <code>network 10.4.2.0 0.0.0.255 area 0</code> pour donner l’accès à nos machines sur le réseau Guests. On fait <code>network 10.4.1.0 0.0.0.255 area 0</code> pour la machine sur le réseau Admins.</p>
<p>On teste une machine guest :</p>
<pre class=" language-bash">

```bash
guest1> ping pornhub.com  
pornhub.com resolved to 66.254.114.41  
84 bytes from 66.254.114.41 icmp_seq=1 ttl=59 time=40.394 ms  
84 bytes from 66.254.114.41 icmp_seq=2 ttl=59 time=58.896 ms  
84 bytes from 66.254.114.41 icmp_seq=3 ttl=59 time=40.101 ms  
84 bytes from 66.254.114.41 icmp_seq=4 ttl=59 time=41.542 ms
```
Ca marche tranquille. On teste maintenant avec notre machine CentOS Admin1 :

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzNTcyNDc2MTJdfQ==
-->