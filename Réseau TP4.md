---


---

<h1 id="i.-topologie-1--simple">I. Topologie 1 : simple</h1>
<h3 id="mise-en-place">2. Mise en place</h3>
<h4 id="a.-topologie-gns3">A. Topologie GNS3</h4>
<p><img src="https://i.imgur.com/vStbWYa.png" alt=""></p>
<p>Ici le setup de base. Tout va bien, la VM CentOS est à gauche, le VPC à droite, le routeur Cisco en haut.<br>
Il faut qu’on paramètre les IP des PC selon le tableau d’adressage. J’ai donc modifié le fichier <code>ifcfg-enp0s9</code> de ma VM CentOS 7, et utilisé la commande <code>ip 10.4.2.11</code> dans la console du VPC.</p>

