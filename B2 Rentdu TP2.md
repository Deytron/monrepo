---


---

<h1 id="tp2--déploiement-automatisé">TP2 : Déploiement automatisé</h1>
<p>Après avoir installé Vagrant tranquille, j’ai commencé le déploiement.</p>
<h2 id="i.-déploiement-simple">I. Déploiement simple</h2>
<p>Le fichier Vagrantfile ressemble à ça du coup :</p>
<pre class=" language-bash"><code class="prism  language-bash">file_to_disk <span class="token operator">=</span> <span class="token string">'/home/lemalgache/vagrant/VagrantDisk.vdi'</span>  
  
Vagrant.configure<span class="token punctuation">(</span><span class="token string">"2"</span><span class="token punctuation">)</span> <span class="token keyword">do</span> <span class="token operator">|</span>config<span class="token operator">|</span>  
config.vm.box <span class="token operator">=</span> <span class="token string">"centos/7"</span>  
config.vm.box_url <span class="token operator">=</span> <span class="token string">"https://vagrantcloud.com/centos/7"</span>  
  
<span class="token comment">## Les 3 lignes suivantes permettent d'éviter certains bugs et/ou d'accélérer le déploiement. Gardez-les tout le temps sauf contre-in  </span>
dications.  
<span class="token comment"># Ajoutez cette ligne afin d'accélérer le démarrage de la VM (si une erreur 'vbguest' est levée, voir la note un peu plus bas)  </span>
config.vbguest.auto_update <span class="token operator">=</span> <span class="token boolean">false</span>  
  
<span class="token comment"># Désactive les updates auto qui peuvent ralentir le lancement de la machine  </span>
config.vm.box_check_update <span class="token operator">=</span> <span class="token boolean">false</span>  
  
<span class="token comment"># La ligne suivante permet de désactiver le montage d'un dossier partagé (ne marche pas tout le temps directement suivant vos OS, ver  </span>
sions d'OS, etc.<span class="token punctuation">)</span>  
config.vm.synced_folder <span class="token string">"."</span>, <span class="token string">"/vagrant"</span>, disabled: <span class="token boolean">true</span>  
  
<span class="token comment"># Config réseau host only  </span>
config.vm.network <span class="token string">"private_network"</span>, ip: <span class="token string">"192.168.2.11"</span>,  
virtualbox__intnet: <span class="token boolean">true</span>  
  
<span class="token comment"># Config du hostname  </span>
config.vm.hostname <span class="token operator">=</span> <span class="token string">"MachineDeOuf"</span>  
  
<span class="token comment"># Setup VirtualBox Provider  </span>
config.vm.provider <span class="token string">"virtualbox"</span> <span class="token keyword">do</span> <span class="token operator">|</span>vb<span class="token operator">|</span>  
vb.customize <span class="token punctuation">[</span><span class="token string">"modifyvm"</span>, :id, <span class="token string">"--memory"</span>, <span class="token string">"1024"</span><span class="token punctuation">]</span>  
vb.customize <span class="token punctuation">[</span><span class="token string">'createhd'</span>, <span class="token string">'--filename'</span>, file_to_disk, <span class="token string">'--size'</span>, 5 * 1024<span class="token punctuation">]</span>  
vb.customize <span class="token punctuation">[</span><span class="token string">'storageattach'</span>, :id, <span class="token string">'--storagectl'</span>, <span class="token string">'IDE'</span>, <span class="token string">'--port'</span>, 1, <span class="token string">'--device'</span>, 0, <span class="token string">'--type'</span>, <span class="token string">'hdd'</span>, <span class="token string">'--medium'</span>, file_to_disk<span class="token punctuation">]</span>  
  
<span class="token comment"># Lancement d'un script au démarrage  </span>
 config.vm.provision <span class="token string">"shell"</span>,  
 path: <span class="token string">"/home/lemalgache/vagrant/script.sh"</span>  
end  
end
</code></pre>
<p>La VM est configurée avec le script qui se lance au démarrage et un disque de 5Go ajouté.</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token punctuation">[</span>vagrant@MachineDeOuf ~<span class="token punctuation">]</span>$ lsblk  
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT  
sda 8:0 0 40G 0 disk  
└─sda1 8:1 0 40G 0 part /  
sdb 8:16 0 5G 0 disk
</code></pre>
<h2 id="ii.-re-package">II. Re-package</h2>
<p>Il est temps de se faire notre propre iso. On va faire l’iso à partir d’une box lancée existante. On prépare d’abord la VM avec un <code>sudo yum update</code>, <code>sudo yum install vim epel-release nginx</code>, un <code>setenforce 0</code> et une édition du fichier selinux/config pour être sûr de ne pas avoir selinux d’activé, une config de firewalld avec <code>sudo systemctl enable firewalld</code> puis <code>sudo systemctl start firewalld</code>, enfin <code>sudo firewall-cmd --set-default-zone=block</code> pour tout bloquer sauf le port 22 avec <code>sudo firewall-cmd --permanent --add-port=22/TCP</code>.<br>
C’est parti, on package le tout :</p>
<pre class=" language-bash"><code class="prism  language-bash">vagrant package --output centos7-custom.box ✔ took 8m 15s  at 21:27:17   
<span class="token operator">==</span><span class="token operator">&gt;</span> default: Attempting graceful <span class="token function">shutdown</span> of VM<span class="token punctuation">..</span>.  
<span class="token operator">==</span><span class="token operator">&gt;</span> default: Clearing any previously <span class="token keyword">set</span> forwarded ports<span class="token punctuation">..</span>.  
<span class="token operator">==</span><span class="token operator">&gt;</span> default: Exporting VM<span class="token punctuation">..</span>.  
<span class="token operator">==</span><span class="token operator">&gt;</span> default: Compressing package to: /home/lemalgache/vagrant/centos7-custom.box
</code></pre>
<h2 id="iii.-multi-node-deployment">III. Multi-node deployment</h2>
<p>On part sur un déploiement tu deux VM, très très simple, une des deux VM a 1Go de RAM, notre fichier de config ressemble à ça :</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token comment"># file_to_disk = '/home/lemalgache/vagrant/VagrantDisk.vdi'  </span>
  
Vagrant.configure<span class="token punctuation">(</span><span class="token string">"2"</span><span class="token punctuation">)</span> <span class="token keyword">do</span> <span class="token operator">|</span>config<span class="token operator">|</span>  
config.vm.box <span class="token operator">=</span> <span class="token string">"CentOS_custom"</span>  
  
<span class="token comment">## Les 3 lignes suivantes permettent d'éviter certains bugs et/ou d'accélérer le déploiement. Gardez-les tout le temps sauf contre-in  </span>
dications.  
<span class="token comment"># Ajoutez cette ligne afin d'accélérer le démarrage de la VM (si une erreur 'vbguest' est levée, voir la note un peu plus bas)  </span>
config.vbguest.auto_update <span class="token operator">=</span> <span class="token boolean">false</span>  
  
<span class="token comment"># Désactive les updates auto qui peuvent ralentir le lancement de la machine  </span>
config.vm.box_check_update <span class="token operator">=</span> <span class="token boolean">false</span>  
  
<span class="token comment"># La ligne suivante permet de désactiver le montage d'un dossier partagé (ne marche pas tout le temps directement suivant vos OS, ver  </span>
sions d'OS, etc.<span class="token punctuation">)</span>  
config.vm.synced_folder <span class="token string">"."</span>, <span class="token string">"/vagrant"</span>, disabled: <span class="token boolean">true</span>  
  
<span class="token comment"># Config de la VM 1  </span>
config.vm.define <span class="token string">"node1"</span> <span class="token keyword">do</span> <span class="token operator">|</span>node1<span class="token operator">|</span>  
node1.vm.network <span class="token string">"private_network"</span>, ip: <span class="token string">"192.168.56.11"</span>  
node1.vm.hostname <span class="token operator">=</span> <span class="token string">"node1.tp2.b2"</span>  
config.vm.provider <span class="token string">"virtualbox"</span> <span class="token keyword">do</span> <span class="token operator">|</span>vb<span class="token operator">|</span>  
vb.customize <span class="token punctuation">[</span><span class="token string">"modifyvm"</span>, :id, <span class="token string">"--memory"</span>, <span class="token string">"1024"</span><span class="token punctuation">]</span>  
end  
end  
  
<span class="token comment"># Config une première VM "node2"  </span>
config.vm.define <span class="token string">"node2"</span> <span class="token keyword">do</span> <span class="token operator">|</span>node2<span class="token operator">|</span>  
node2.vm.network <span class="token string">"private_network"</span>, ip: <span class="token string">"192.168.56.12"</span>  
node2.vm.hostname <span class="token operator">=</span> <span class="token string">"node2.tp2.b2"</span>  
config.vm.provider <span class="token string">"virtualbox"</span> <span class="token keyword">do</span> <span class="token operator">|</span>vb<span class="token operator">|</span>  
vb.customize <span class="token punctuation">[</span><span class="token string">"modifyvm"</span>, :id, <span class="token string">"--memory"</span>, <span class="token string">"512"</span><span class="token punctuation">]</span>  
end  
end  
  
  
<span class="token comment"># Config réseau host only  </span>
<span class="token comment"># config.vm.network "private_network", ip: "192.168.2.11",  </span>
<span class="token comment"># virtualbox__intnet: true  </span>
  
<span class="token comment"># Config du hostname  </span>
  
<span class="token comment"># Setup VirtualBox Provider  </span>
<span class="token comment"># config.vm.provider "virtualbox" do |vb|  </span>
<span class="token comment"># vb.customize ["modifyvm", :id, "--memory", "1024"]  </span>
<span class="token comment"># vb.customize ['createhd', '--filename', file_to_disk, '--size', 5 * 1024]  </span>
<span class="token comment"># vb.customize ['storageattach', :id, '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]  </span>
  
<span class="token comment"># Lancement d'un script au démarrage  </span>
<span class="token comment"># config.vm.provision "shell",  </span>
<span class="token comment"># path: "/home/lemalgache/vagrant/script.sh"  </span>
end
</code></pre>
<p>Et le bail marche tranquille.</p>
<h2 id="iv.-automation-here-we-slowly-come">IV. Automation here we (slowly) come</h2>
<p>Bon, va falloir automatiser totu ça avec des scripts de commandes. J’ai décidé de faire un script commun aux deux machines, et un script unique à chaque. Dans le script commun appelé “<a href="http://script2.sh">script2.sh</a>” :</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">echo</span> <span class="token string">"192.168.56.11 node1.tp2.b2 node1"</span> <span class="token operator">&gt;&gt;</span> /etc/hosts  
<span class="token keyword">echo</span> <span class="token string">"192.168.56.12 node2.tp2.b2 node2"</span> <span class="token operator">&gt;&gt;</span> /etc/hosts  
<span class="token function">useradd</span> user1  
<span class="token keyword">echo</span> <span class="token string">"user1 ALL=(ALL) NOPASSWD:ALL"</span> <span class="token operator">&gt;&gt;</span> /etc/sudoers  
firewall-cmd --set-default-zone<span class="token operator">=</span>block  
firewall-cmd --add-port<span class="token operator">=</span>22/tcp  
firewall-cmd --permanent --zone<span class="token operator">=</span>trusted --add-source<span class="token operator">=</span>192.168.56.11  
firewall-cmd --permanent --zone<span class="token operator">=</span>trusted --add-source<span class="token operator">=</span>192.168.56.12  
firewall-cmd --reload  
setenforce 0  
<span class="token function">sed</span> -i <span class="token string">'s/SELINUX=enforcing/SELINUX=disabled/g'</span> /etc/selinux/config
</code></pre>
<p>Au moins on est sûr qu’il y a pas de problème. Sur le <a href="http://scriptnode1.sh">scriptnode1.sh</a> :</p>
<pre class=" language-bash"><code class="prism  language-bash">
</code></pre>

