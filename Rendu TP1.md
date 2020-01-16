---


---

<h1 id="tp-1---romain-ranaivoson"><strong>TP 1</strong> - Romain Ranaivoson</h1>
<h2 id="affichage-dinformations-sur-la-pile-tcpip-locale">1. Affichage d’informations sur la pile TCP/IP locale</h2>
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
<h2 id="modification-des-informations">2. Modification des informations</h2>
<p>Pour changer d’adresse IPv4 sur Windows :</p>
<ul>
<li>Allez dans <code>Paramètres &gt; Réseau et Internet &gt; WiFi</code></li>
<li>A droite, cliquez sur <code>Modifiez les options d'adaptateurs</code></li>
<li>Vous arrivez dans le centre réseau et partage. Clic droit sur le matériel réseau duquel on veut changer l’IP &gt; <code>Propriétés</code><br>
<img src="https://i.imgur.com/d40knqi.png" alt="enter image description here"></li>
<li>Cliquez sur `Protocole Internet IPv4</li>
</ul>

