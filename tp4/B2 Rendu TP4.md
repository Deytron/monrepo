# TP4 : Déploiement multi-noeud

## 0. Prerequisites

Je me suis pas embêté, j'ai repackage une box CentOS7 avec une update, nano, vim, nginx et selinux désactivé.

## 0.1 Tableau des machines

| Nom             | IP            | Rôle            |
| --------------- | ------------- | --------------- |
| node1.tp4.gitea | 192.168.56.11 | Gitea           |
| node1.tp4.bdd   | 192.168.56.12 | Base de données |
| node1.tp4.nginx | 192.168.56.13 | NGINX           |
| node1.tp4.nfs   | 192.168.56.14 | Serveur NFS     |