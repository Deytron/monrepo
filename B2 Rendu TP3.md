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
<p>Oui ça fait beaucoup.</p>

