---


---

<h1 id="tp3--systemd">TP3 : systemd</h1>
<h2 id="i.-services-systemd">I. Services systemd</h2>
<h3 id="intro">1. Intro</h3>
<p>Pour voir TOUS les services dispos sur la machine, on utilise l’argument <code>--all</code>, donc <code>systemctl list-units --type=service</code> :</p>
<pre class=" language-bash"><code class="prism  language-bash">UNIT LOAD ACTIVE SUB DESCRIPTION  
auditd.service loaded active running Security Auditing Service  
auth-rpcgss-module.service loaded inactive dead Kernel Module supporting RPCSEC_GSS  
chronyd.service loaded active running NTP client/server  
● cloud-init-local.service not-found inactive dead cloud-init-local.service  
cpupower.service loaded inactive dead Configure CPU power related settings  
crond.service loaded active running Command Scheduler  
dbus.service loaded active running D-Bus System Message Bus  
● display-manager.service not-found inactive dead display-manager.service  
dracut-cmdline.service loaded inactive dead dracut cmdline hook  
dracut-initqueue.service loaded inactive dead dracut initqueue hook  
dracut-mount.service loaded inactive dead dracut <span class="token function">mount</span> hook  
dracut-pre-mount.service loaded inactive dead dracut pre-mount hook  
dracut-pre-pivot.service loaded inactive dead dracut pre-pivot and cleanup hook  
dracut-pre-trigger.service loaded inactive dead dracut pre-trigger hook  
dracut-pre-udev.service loaded inactive dead dracut pre-udev hook  
dracut-shutdown.service loaded inactive dead Restore /run/initramfs  
ebtables.service loaded inactive dead Ethernet Bridge Filtering tables  
emergency.service loaded inactive dead Emergency Shell  
● exim.service not-found inactive dead exim.service  
firewalld.service loaded active running firewalld - dynamic firewall daemon  
getty@tty1.service loaded active running Getty on tty1  
gssproxy.service loaded active running GSSAPI Proxy Daemon  
initrd-cleanup.service loaded inactive dead Cleaning Up and Shutting Down Daemons  
initrd-parse-etc.service loaded inactive dead Reload Configuration from the Real Root  
initrd-switch-root.service loaded inactive dead Switch Root  
initrd-udevadm-cleanup-db.service loaded inactive dead Cleanup udevd DB  
● ip6tables.service not-found inactive dead ip6tables.service  
● ipset.service not-found inactive dead ipset.service  
● iptables.service not-found inactive dead iptables.service  
irqbalance.service loaded inactive dead irqbalance daemon  
kmod-static-nodes.service loaded active exited Create list of required static device nodes <span class="token keyword">for</span> the current kernel  
network.service loaded active exited LSB: Bring up/down networking  
NetworkManager-wait-online.service loaded active exited Network Manager Wait Online  
NetworkManager.service loaded active running Network Manager  
nfs-config.service loaded inactive dead Preprocess NFS configuration  
nfs-idmapd.service loaded inactive dead NFSv4 ID-name mapping <span class="token function">service</span>  
nfs-mountd.service loaded inactive dead NFS Mount Daemon  
● nfs-secure-server.service not-found inactive dead nfs-secure-server.service  
nfs-server.service loaded inactive dead NFS server and services  
nfs-utils.service loaded inactive dead NFS server and client services  
● ntpd.service not-found inactive dead ntpd.service  
● ntpdate.service not-found inactive dead ntpdate.service  
● plymouth-quit-wait.service not-found inactive dead plymouth-quit-wait.service  
● plymouth-start.service not-found inactive dead plymouth-start.service  
polkit.service loaded active running Authorization Manager  
postfix.service loaded active running Postfix Mail Transport Agent  
rc-local.service loaded inactive dead /etc/rc.d/rc.local Compatibility  
rescue.service loaded inactive dead Rescue Shell  
rhel-autorelabel-mark.service loaded inactive dead Mark the need to relabel after <span class="token function">reboot</span>  
rhel-autorelabel.service loaded inactive dead Relabel all filesystems, <span class="token keyword">if</span> necessary  
rhel-configure.service loaded inactive dead Reconfigure the system on administrator request  
rhel-dmesg.service loaded active exited Dump <span class="token function">dmesg</span> to /var/log/dmesg  
rhel-domainname.service loaded active exited Read and <span class="token keyword">set</span> NIS domainname from /etc/sysconfig/network  
rhel-import-state.service loaded inactive dead Import network configuration from initramfs  
rhel-loadmodules.service loaded inactive dead Load legacy module configuration  
rhel-readonly.service loaded active exited Configure read-only root support  
rpc-gssd.service loaded inactive dead RPC security <span class="token function">service</span> <span class="token keyword">for</span> NFS client and server  
rpc-statd-notify.service loaded inactive dead Notify NFS peers of a restart  
rpc-statd.service loaded inactive dead NFS status monitor <span class="token keyword">for</span> NFSv2/3 locking.  
rpcbind.service loaded active running RPC bind <span class="token function">service</span>  
rsyslog.service loaded active running System Logging Service  
selinux-policy-migrate-local-changes@targeted.service loaded inactive dead Migrate local SELinux policy changes from the old store structure to  
● sendmail.service not-found inactive dead sendmail.service  
● sntp.service not-found inactive dead sntp.service  
sshd-keygen.service loaded inactive dead OpenSSH Server Key Generation  
sshd.service loaded active running OpenSSH server daemon  
● syslog.service not-found inactive dead syslog.service  
systemd-ask-password-console.service loaded inactive dead Dispatch Password Requests to Console  
systemd-ask-password-wall.service loaded inactive dead Forward Password Requests to Wall  
systemd-binfmt.service loaded inactive dead Set Up Additional Binary Formats  
systemd-firstboot.service loaded inactive dead First Boot Wizard  
systemd-fsck-root.service loaded inactive dead File System Check on Root Device  
systemd-hwdb-update.service loaded inactive dead Rebuild Hardware Database  
systemd-initctl.service loaded inactive dead /dev/initctl Compatibility Daemon  
systemd-journal-catalog-update.service loaded inactive dead Rebuild Journal Catalog  
systemd-journal-flush.service loaded active exited Flush Journal to Persistent Storage  
systemd-journald.service loaded active running Journal Service  
systemd-logind.service loaded active running Login Service  
systemd-machine-id-commit.service loaded inactive dead Commit a transient machine-id on disk  
systemd-modules-load.service loaded inactive dead Load Kernel Modules  
systemd-random-seed.service loaded active exited Load/Save Random Seed  
systemd-readahead-collect.service loaded inactive dead Collect Read-Ahead Data  
systemd-readahead-done.service loaded inactive dead Stop Read-Ahead Data Collection  
systemd-readahead-replay.service loaded inactive dead Replay Read-Ahead Data  
systemd-reboot.service loaded inactive dead Reboot  
systemd-remount-fs.service loaded active exited Remount Root and Kernel File Systems  
systemd-shutdownd.service loaded inactive dead Delayed Shutdown Service  
systemd-sysctl.service loaded active exited Apply Kernel Variables  
● systemd-sysusers.service not-found inactive dead systemd-sysusers.service  
● systemd-timesyncd.service not-found inactive dead systemd-timesyncd.service  
systemd-tmpfiles-clean.service loaded inactive dead Cleanup of Temporary Directories  
systemd-tmpfiles-setup-dev.service loaded active exited Create Static Device Nodes <span class="token keyword">in</span> /dev  
systemd-tmpfiles-setup.service loaded active exited Create Volatile Files and Directories  
systemd-udev-trigger.service loaded active exited udev Coldplug all Devices  
systemd-udevd.service loaded active running udev Kernel Device Manager  
systemd-update-done.service loaded inactive dead Update is Completed  
systemd-update-utmp-runlevel.service loaded inactive dead Update UTMP about System Runlevel Changes  
systemd-update-utmp.service loaded active exited Update UTMP about System Boot/Shutdown  
systemd-user-sessions.service loaded active exited Permit User Sessions  
systemd-vconsole-setup.service loaded active exited Setup Virtual Console  
tuned.service loaded active running Dynamic System Tuning Daemon  
vgauthd.service loaded inactive dead VGAuth Service <span class="token keyword">for</span> open-vm-tools  
vmtoolsd-init.service loaded inactive dead One-time configuration <span class="token keyword">for</span> vmtoolsd  
vmtoolsd.service loaded inactive dead Service <span class="token keyword">for</span> virtual machines hosted on VMware  
● ypbind.service not-found inactive dead ypbind.service  
● yppasswdd.service not-found inactive dead yppasswdd.service  
● ypserv.service not-found inactive dead ypserv.service  
● ypxfrd.service not-found inactive dead ypxfrd.service  
  
LOAD <span class="token operator">=</span> Reflects whether the unit definition was properly loaded.  
ACTIVE <span class="token operator">=</span> The high-level unit activation state, i.e. generalization of SUB.  
SUB <span class="token operator">=</span> The low-level unit activation state, values depend on unit type.  
  
108 loaded <span class="token function">units</span> listed.  
To show all installed unit files use <span class="token string">'systemctl list-unit-files'</span><span class="token keyword">.</span>
</code></pre>
<p>Oui ça fait beaucoup.<br>
Pour voir les services actifs uniquement, c’est <code>systemctl list-units --type=service --state=running</code>. Y en a 17 en cours sur ma machine.</p>
<pre class=" language-bash"><code class="prism  language-bash">UNIT LOAD ACTIVE SUB DESCRIPTION  
auditd.service loaded active running Security Auditing Service  
chronyd.service loaded active running NTP client/server  
crond.service loaded active running Command Scheduler  
dbus.service loaded active running D-Bus System Message Bus  
firewalld.service loaded active running firewalld - dynamic firewall daemon  
getty@tty1.service loaded active running Getty on tty1  
gssproxy.service loaded active running GSSAPI Proxy Daemon  
NetworkManager.service loaded active running Network Manager  
polkit.service loaded active running Authorization Manager  
postfix.service loaded active running Postfix Mail Transport Agent  
rpcbind.service loaded active running RPC bind <span class="token function">service</span>  
rsyslog.service loaded active running System Logging Service  
sshd.service loaded active running OpenSSH server daemon  
systemd-journald.service loaded active running Journal Service  
systemd-logind.service loaded active running Login Service  
systemd-udevd.service loaded active running udev Kernel Device Manager  
tuned.service loaded active running Dynamic System Tuning Daemon  
  
LOAD <span class="token operator">=</span> Reflects whether the unit definition was properly loaded.  
ACTIVE <span class="token operator">=</span> The high-level unit activation state, i.e. generalization of SUB.  
SUB <span class="token operator">=</span> The low-level unit activation state, values depend on unit type.  
  
17 loaded <span class="token function">units</span> listed.
</code></pre>
<p>En reprenant la dernière commande, on peut voir ceux qui ont foiré ou qui ne sont plus en cours, avec plusieurs arguments, <code>systemctl list-units --type=service --state=failed,exited</code>. Bon moi j’en ai aucune qui a fail et j’allais pas m’embêter à mal configurer un service pour avoir un état failed donc tant pis, y a que les exited :</p>
<pre class=" language-bash"><code class="prism  language-bash">UNIT LOAD ACTIVE SUB DESCRIPTION  
kmod-static-nodes.service loaded active exited Create list of required static device nodes <span class="token keyword">for</span> the current kernel  
network.service loaded active exited LSB: Bring up/down networking  
NetworkManager-wait-online.service loaded active exited Network Manager Wait Online  
rhel-dmesg.service loaded active exited Dump <span class="token function">dmesg</span> to /var/log/dmesg  
rhel-domainname.service loaded active exited Read and <span class="token keyword">set</span> NIS domainname from /etc/sysconfig/network  
rhel-readonly.service loaded active exited Configure read-only root support  
systemd-journal-flush.service loaded active exited Flush Journal to Persistent Storage  
systemd-random-seed.service loaded active exited Load/Save Random Seed  
systemd-remount-fs.service loaded active exited Remount Root and Kernel File Systems  
systemd-sysctl.service loaded active exited Apply Kernel Variables  
systemd-tmpfiles-setup-delinux systemd user <span class="token function">service</span> permissionsv.service loaded active exited Create Static Device Nodes <span class="token keyword">in</span> /dev  
systemd-tmpfiles-setup.service loaded active exited Create Volatile Files and Directories  
systemd-udev-trigger.service loaded active exited udev Coldplug all Devices  
systemd-update-utmp.service loaded active exited Update UTMP about System Boot/Shutdown  
systemd-user-sessions.service loaded active exited Permit User Sessions  
systemd-vconsole-setup.service loaded active exited Setup Virtual Console  
  
LOAD <span class="token operator">=</span> Reflects whether the unit definition was properly loaded.  
ACTIVE <span class="token operator">=</span> The high-level unit activation state, i.e. generalization of SUB.  
SUB <span class="token operator">=</span> The low-level unit activation state, values depend on unit type.  
  
16 loaded <span class="token function">units</span> listed.
</code></pre>
<p>Enfin, pour voir les services qui se lancent au boot, donc “enabled”, on utilise <code>systemctl list-unit-files | grep enabled</code>. Enabled n’est pas un state, c’est juste une marque qui indique si le service démarre au boot.</p>
<pre class=" language-bash"><code class="prism  language-bash">auditd.service enabled  
autovt@.service enabled  
chronyd.service enabled  
crond.service enabled  
dbus-org.fedoraproject.FirewallD1.service enabled  
dbus-org.freedesktop.nm-dispatcher.service enabled  
firewalld.service enabled  
getty@.service enabled  
irqbalance.service enabled  
NetworkManager-dispatcher.service enabled  
NetworkManager-wait-online.service enabled  
NetworkManager.service enabled  
postfix.service enabled  
qemu-guest-agent.service enabled  
rhel-autorelabel-mark.service enabled  
rhel-autorelabel.service enabled  
rhel-configure.service enabled  
rhel-dmesg.service enabled  
rhel-domainname.service enabled  
rhel-import-state.service enabled  
rhel-loadmodules.service enabled  
rhel-readonly.service enabled  
rpcbind.service enabled  
rsyslog.service enabled  
sshd.service enabled  
systemd-readahead-collect.service enabled  
systemd-readahead-drop.service enabled  
systemd-readahead-replay.service enabled  
tuned.service enabled  
vgauthd.service enabled  
vmtoolsd-init.service enabled  
vmtoolsd.service enabled  
rpcbind.socket enabled  
default.target enabled  
multi-user.target enabled  
nfs-client.target enabled  
remote-fs.target enabled  
runlevel2.target enabled  
runlevel3.target enabled  
runlevel4.target enabled
</code></pre>
<h3 id="analyse-dun-service">2. Analyse d’un service</h3>
<p>On va afficher le contenu de l’unité sytemd nginx. Pour ça, on fait un petit <code>systemctl cat nginx</code><br>
J’explique les lignes nécessaires juste en dessous en commentaire.</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token comment"># /usr/lib/systemd/system/nginx.service  </span>
<span class="token punctuation">[</span>Unit<span class="token punctuation">]</span>  
Description<span class="token operator">=</span>The nginx HTTP and reverse proxy server  
<span class="token comment">### Moi je pense la question elle est vite répondue. C'est juste une description de l'unité de service. En plus celle-la elle sert à rien</span>

After<span class="token operator">=</span>network.target remote-fs.target nss-lookup.target
<span class="token comment">### Précise que l'unité de service ne peut se lancer QU'APRES les autres unités de service précisées  </span>
  
<span class="token punctuation">[</span>Service<span class="token punctuation">]</span>  
Type<span class="token operator">=</span>forking 
<span class="token comment">### Précise le type de démarrage pour cette unité de service. Choix possibles : simple, exec, forking, oneshot, dbus, notify ou idle. Ici, "forking" lance le processus avec le protocole UNIX traditionnel</span>
 
PIDFile<span class="token operator">=</span>/run/nginx.pid  
<span class="token comment">### Précise l'emplacement du fichier PID, généralement sous /run. Usage recommandé si le type est défini comme "forking"</span>

<span class="token comment"># Nginx will fail to start if /run/nginx.pid already exists but has the wrong  </span>
<span class="token comment"># SELinux context. This might happen when running `nginx -t` from the cmdline.  </span>
<span class="token comment"># https://bugzilla.redhat.com/show_bug.cgi?id=1268621 </span>
 
ExecStartPre<span class="token operator">=</span>/usr/bin/rm -f /run/nginx.pid  
ExecStartPre<span class="token operator">=</span>/usr/sbin/nginx -t  
<span class="token comment">### Les deux ExecStartPre sont des commandes en plus qui sont lancées juste avant la commande ExecStart. ExecStartPost fait la même chose mais après ExecStart.</span>

ExecStart<span class="token operator">=</span>/usr/sbin/nginx  
<span class="token comment">### Le fichier exécutable à lancer est précisé là</span>

ExecReload<span class="token operator">=</span>/bin/kill -s HUP <span class="token variable">$MAINPID</span>  
<span class="token comment">### Optionnel. Précise la commande à utiliser pour enclencher un redémarrage du service, généralement un signal. $MAINPID est une variable environnement spéciale liée au démon du processus.</span>
KillSignal<span class="token operator">=</span>SIGQUIT  
TimeoutStopSec<span class="token operator">=</span>5  
KillMode<span class="token operator">=</span>process  
PrivateTmp<span class="token operator">=</span>true  
  
<span class="token punctuation">[</span>Install<span class="token punctuation">]</span>  
WantedBy<span class="token operator">=</span>multi-user.target
</code></pre>
<p>Pour lister tous les services qui contiennent la ligne <code>WantedBy=multi-user.target</code>, on va pas chercher très loin, on va grep tous les fichiers de services (y en a genre 300 sur ma distrib) et cherche le pattern correspondant, donc <code>grep -r "WantedBy=multi-user.target" /run/systemd/transient/* /etc/systemd/system/* /run/systemd/generator/* /usr/lib/systemd/system/*</code>. On le fait à tous les emplacements où il y a les services systemd, pour les trouver on a <code>man systemd.service</code>.</p>
<pre class=" language-bash"><code class="prism  language-bash">grep: /run/systemd/transient/*: No such <span class="token function">file</span> or directory  
/etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/auditd.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/brandbot.path:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/chronyd.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/chrony-wait.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/cpupower.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/crond.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/ebtables.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/firewalld.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/fstrim.timer:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/gssproxy.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/irqbalance.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/machines.target:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/NetworkManager.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/nfs-client.target:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/nfs-rquotad.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/nfs-server.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/nfs.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/nginx.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/postfix.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/rdisc.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/remote-cryptsetup.target:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/remote-fs.target:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/rhel-configure.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/rpcbind.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/rpc-rquotad.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/rsyncd.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/rsyslog.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/sshd.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/tcsd.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/tuned.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/vmtoolsd.service:WantedBy<span class="token operator">=</span>multi-user.target  
/usr/lib/systemd/system/wpa_supplicant.service:WantedBy<span class="token operator">=</span>multi-user.target
</code></pre>
<p>Boum.</p>
<h3 id="création-dun-service">3. Création d’un service</h3>
<h4 id="a.-serveur-web">A. Serveur web</h4>
<p>On est parti pour créer nous-même notre service, pas très compliqué on s’y attaque. Dédicace à i3 qui m’a bien fait taffer le truc étant donné que le machin vient sans rien comme service mais c’est rien c’est la rue.</p>
<p>On trace vers <code>/etc/systemd/system</code>, j’ai nommé mon fichier <code>serveurtp.service</code>, et voici le contenu :</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token punctuation">[</span>Unit<span class="token punctuation">]</span>  
Description<span class="token operator">=</span>Le serveur pour le TP t'as capté  
  
<span class="token punctuation">[</span>Service<span class="token punctuation">]</span>  
Type<span class="token operator">=</span>forking  
User<span class="token operator">=</span>user1  
Environment<span class="token operator">=</span><span class="token string">"PORT=8080"</span>  
ExecStartPre<span class="token operator">=</span>/usr/bin/sudo /usr/bin/firewall-cmd --add-port<span class="token operator">=</span><span class="token variable">${PORT}</span>/tcp  
ExecStart<span class="token operator">=</span>/usr/bin/sudo /usr/bin/python3 -m http.server <span class="token variable">${PORT}</span>  
ExecReload<span class="token operator">=</span>/bin/kill -HUP <span class="token variable">$MAINPID</span>  
ExecStop<span class="token operator">=</span>/usr/bin/sudo /usr/bin/firewall-cmd --remove-port<span class="token operator">=</span><span class="token variable">${PORT}</span>/tcp  
TimeoutSec<span class="token operator">=</span>1800  
  
<span class="token punctuation">[</span>Install<span class="token punctuation">]</span>  
WantedBy<span class="token operator">=</span>multi-user.target
</code></pre>
<p>A savoir qu’il faut impérativement ajouter user1 aux sudoers et lancer les commandes en tant que sudo (/usr/bin/sudo) sinon ça ne marche pas. Sur CentOS8, au lieu de /usr/bin/sudo, on aurait pu utiliser <code>ExecStart=+</code>, mais c’est pas possible là. Voilà le curl :</p>
<pre class=" language-html"><code class="prism  language-html"><span class="token doctype">&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;</span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>html</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>head</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>meta</span> <span class="token attr-name">http-equiv</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>Content-Type<span class="token punctuation">"</span></span> <span class="token attr-name">content</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>text/html; charset=utf-8<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>title</span><span class="token punctuation">&gt;</span></span>Directory listing for /<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>title</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>head</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>body</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>Directory listing for /<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>hr</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>ul</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>.autorelabel<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>.autorelabel<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>bin/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>bin@<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>boot/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>boot/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>dev/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>dev/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>etc/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>etc/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>home/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>home/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>lib/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>lib@<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>lib64/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>lib64@<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>media/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>media/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>mnt/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>mnt/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>opt/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>opt/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>proc/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>proc/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>root/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>root/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>run/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>run/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>sbin/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>sbin@<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>srv/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>srv/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>swapfile<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>swapfile<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>sys/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>sys/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>tmp/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>tmp/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>usr/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>usr/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>a</span> <span class="token attr-name">href</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>var/<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>var/<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>a</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>ul</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>hr</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>body</span><span class="token punctuation">&gt;</span></span>  
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>html</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<h4 id="b.-sauvegarde">B. Sauvegarde</h4>
<p>J’ai récupéré le script de sauvegarde basique que j’avais fait au TP1 et je l’ai mis dans mon dossier /home. Je viens créer une unité de service que je vais nommer <code>systembackup.service</code>.   En voilà le contenu :</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token punctuation">[</span>Unit<span class="token punctuation">]</span>  
Description<span class="token operator">=</span>Unité de <span class="token function">service</span> qui va lancer un script de sauvegarde  
  
<span class="token punctuation">[</span>Service<span class="token punctuation">]</span>  
Environment<span class="token operator">=</span><span class="token string">"SCRIPTPRE=/home/user1/tp1_pre.sh"</span>  
Environment<span class="token operator">=</span><span class="token string">"SCRIPT=/home/user1/tp1_backup.sh"</span>  
Environment<span class="token operator">=</span><span class="token string">"SCRIPTPOST=/home/user1/tp1_post.sh"</span>  
User<span class="token operator">=</span>user1  
PIDFile<span class="token operator">=</span>/var/run/tp1_backup/pid  
ExecStartPre<span class="token operator">=</span>/usr/bin/sh <span class="token variable">${SCRIPTPRE}</span>  
ExecStart<span class="token operator">=</span>/usr/bin/sh <span class="token variable">${SCRIPT}</span>  
ExecStartPost<span class="token operator">=</span>/usr/bin/sh <span class="token variable">${SCRIPTPOST}</span>  
  
<span class="token punctuation">[</span>Install<span class="token punctuation">]</span>  
WantedBy<span class="token operator">=</span>multi-user.target
</code></pre>
<p>Le service va venir chercher 3 scripts, un avant le script de backup, le script de backup, et un juste après pour la rotation.</p>

