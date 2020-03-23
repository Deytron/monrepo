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
<p>On fait la topologie oklm</p>
<p><img src="https://i.imgur.com/XnsUtVB.png" alt=""></p>

