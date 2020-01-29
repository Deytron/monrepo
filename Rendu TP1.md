---


---

<h1 id="tp-1---romain-ranaivoson"><strong>TP 1</strong> - Romain Ranaivoson</h1>
<h2 id="i.-affichage-dinformations-sur-la-pile-tcpip-locale">I. Affichage d’informations sur la pile TCP/IP locale</h2>
<p>Pour trouver les informations réseaux en CLI, taper <code>ipconfig /all</code></p>
<p>Carte réseau sans fil Wi-Fi :</p>
<p>Suffixe DNS propre à la connexion. . . : <a href="http://auvence.co">auvence.co</a><br>
Description. . . . . . . . . . . . . . : Intel® Wireless-AC 9560 160MHz<br>
Adresse physique . . . . . . . . . . . : D0-C6-37-81-8F-C6<br>
DHCP activé. . . . . . . . . . . . . . : Oui<br>
Configuration automatique activée. . . : Oui<br>
Adresse IPv6 de liaison locale. . . . .: fe80::ad4b:f94b:5ab:f2da%9(préféré)<br>
Adresse IPv4. . . . . . . . . . . . . .: 10.33.0.186(préféré)<br>
Masque de sous-réseau. . . . . . . . . : 255.255.252.0<br>
Bail obtenu. . . . . . . . . . . . . . : jeudi 16 janvier 2020 13:24:41<br>
Bail expirant. . . . . . . . . . . . . : jeudi 16 janvier 2020 16:07:34<br>
Passerelle par défaut. . . . . . . . . : 10.33.3.253<br>
Serveur DHCP . . . . . . . . . . . . . : 10.33.3.254<br>
IAID DHCPv6 . . . . . . . . . . . : 114345527<br>
DUID de client DHCPv6. . . . . . . . : 00-01-00-01-24-E9-D2-57-D0-C6-37-81-8F-C6<br>
Serveurs DNS. . .  . . . . . . . . . . : 10.33.10.20<br>
10.33.10.2<br>
8.8.8.8<br>
8.8.4.4<br>
NetBIOS sur Tcpip. . . . . . . . . . . : Activé</p>
<hr>
<p>Pas d’interface Ethernet</p>
<hr>
<p>Comment afficher les infos réseau ? (Windows 10) :</p>
<ul>
<li>Aller dans <code>Paramètres &gt; Réseau et Internet &gt; WiFi</code> et cliquer sur <code>Propriétés du matériel</code><br>
<img src="https://i.imgur.com/aOaHLtr.png" alt="Les informations seront affichées ici"></li>
</ul>
<p>A quoi sert une gateway dans le réseau d’Ynov ?</p>
<ul>
<li>Une gateway (passerelle en français) est une sorte de “portail” entre deux réseaux. Ce portail permet de faire passer le trafic Internet entre les deux réseaux.  Il peut aussi traduire dans un autre protocole les données reçues d’un réseau à l’autre.<br>
A Ynov, l’intérêt d’une gateway est de pouvoir accéder à Internet même en étant dans l’intranet Ynov.</li>
</ul>
<h2 id="ii.-modification-des-informations">II. Modification des informations</h2>
<h3 id="a.-changer-dadresse-ip">A. Changer d’adresse IP</h3>
<p>Pour changer d’adresse IPv4 sur Windows :</p>
<ul>
<li>Allez dans <code>Paramètres &gt; Réseau et Internet &gt; WiFi</code></li>
<li>A droite, cliquez sur <code>Modifiez les options d'adaptateurs</code></li>
<li>Vous arrivez dans le centre réseau et partage. Clic droit sur le matériel réseau duquel on veut changer l’IP &gt; <code>Propriétés</code><br>
<img src="https://i.imgur.com/d40knqi.png" alt="enter image description here"></li>
<li>Cliquez sur <code>Protocole Internet IPv4</code>, puis sur <code>Propriétés</code></li>
<li>Changer l’adresse, puis OK.</li>
</ul>
<p>Adresse IP Initiale : <code>10.33.0.186</code> changée en <code>10.33.0.190</code><br>
Et bang c’est la merde :<br>
<img src="https://i.imgur.com/SY4isZ4.png" alt="enter image description here">La raison de pourquoi j’ai perdu le réseau et pourquoi j’ai Windows qui est venu me sauver, c’est parce que l’adresse que j’ai choisie parmi celles disponibles (en .190) est déjà attribuée par le DHCP Ynov à un autre appareil sur le réseau. Et il ne peut pas y avoir deux adresses IP pareilles sur un réseau.</p>
<h3 id="b.-nmap">B. Nmap</h3>
<p>Sur Windows, une erreur m’empêche de progresser, car nmap cherche une carte réseau inexistante.<br>
<img src="https://i.imgur.com/firV5t6.png" alt="enter image description here"><br>
Donc tant pis, j’aurais essayé</p>
<h1 id="ii.-exploration-locale-en-duo">II. Exploration locale en duo</h1>
<h3 id="modification-dadresse-ip">3. Modification d’adresse IP</h3>
<p>Les adresses choisies auront été 192.168.1.1 et 192.168.1.2.</p>
<p><img src="https://i.imgur.com/bFFynq7.png" alt=""></p>
<p>Les deux machines se ping bien<br>
<img src="https://i.imgur.com/aLJlr7e.jpg" alt=""></p>
<h3 id="utilisation-dun-des-deux-comme-gateway">4. Utilisation d’un des deux comme gateway</h3>
<p>Impossible de partager la connexion du PC avec Wifi au PC sans Wifi. Sous Windows, à chaque fois que j’active le partage, le réseau Wifi ne fonctionne plus (réseau non identifié). Dès que le partage est désactivé, Internet fonctionne.</p>
<h3 id="petit-chat-privé">5.Petit chat privé</h3>
<p>Après paramétrage, tout fonctionne dans les deux sens<br>
<img src="https://i.imgur.com/BxRYKZl.png" alt=""></p>
<h3 id="wireshark">6. Wireshark</h3>
<p>Résultats ping dans Wireshark :<br>
<img src="https://i.imgur.com/3Rc3Mcu.png" alt=""></p>
<p>Résultats netcat dans Wireshark avec quelques messages envoyés :<br>
<img src="https://i.imgur.com/qvgdneN.png" alt=""></p>
<h3 id="firewall">7. Firewall</h3>
<h4 id="pour-autoriser-les-ping">Pour autoriser les ping</h4>
<p>On part dans les paramètres du pare-feu Windows pour ajouter une règle de connexion entrante.<br>
Dans les options on sélectionne : Personnalisée &gt; Tous les programmes<br>
Type de protocole : ICMPv4 (Requêtes d’écho)<br>
Sélectionner les adresses IP autorisées (toutes ou aucunes)<br>
Sélectionner les domaines<br>
Mettre un nom et une description<br>
Boum les pings rentrent<br>
Répéter sur le second ordinateur si l’on veut que les ping fonctionnent dans les deux sens</p>
<h4 id="pour-autoriser-netcat">Pour autoriser netcat</h4>
<p>Même chose, on ajoute une règle de trafic entrant dans le firewall<br>
Dans les options on sélectionne : Port &gt; Tous les programmes<br>
TCP ou UDP (peu importe)<br>
Ports locaux spécifiques : on en choisit un (ici 1337)<br>
Autoriser la connexion<br>
Choisir les domaines<br>
Bang netcat fonctionne si le port sélectionné dans le cmd est le port autorisé dans le firewall<br>
<img src="https://i.imgur.com/c5HJcbe.png" alt=""></p>
<h1 id="iii.-manipulations-dautres-outilsprotocoles-côté-client">III. Manipulations d’autres outils/protocoles côté client</h1>
<h3 id="dhcp">1. DHCP</h3>
<ul>
<li>Adresse IP du DHCP : 10.33.3.254 (dernière IP dispo sur la plage d’IP)</li>
<li>Pour trouver la durée du bail DHCP, faire <code>ipconfig /all</code>, et chercher les lignes “Bails courant/ Bails expirants”<br>
<img src="https://i.imgur.com/0M6gDre.png" alt="enter image description here"></li>
<li>Pour demander une nouvelle adresse IP au DHCP sur Windows, il faut utiliser <code>ipconfig /renew</code></li>
</ul>

