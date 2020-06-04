# Sujet 1 : Ecrire de l'assembleur
### Le XOR
On va créer un Xor avec notre petit émulateur 8086.

# Sujet 4 : Analyse de boot
### Exo 1
On va voir quels processus se lancent au démarrage, et quels sont les plus longs à démarrer. 
On utilise la commande pratique `systemd-analyze plot > graphe.svg` et ça donne ça :
![](https://i.imgur.com/cx0ls9f.png)
Evidemment, la liste est giga longue donc j'ai pas tout mis, mais on a tous les processus de lancement. Ceux qui mettent le plus longtemps à se lancer dans le systemd sont ceux qui sont le plus en rouge, en "activating". Les 5 

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUzOTcwMTQ1OCw3NzcwMzgyNjIsMTI5Mz
IyMzE2LDQ0Nzg1Mzg1Nyw5OTQ3OTQ5MDgsLTEzMTQzNDQ5MDEs
ODk5NjQ4NjAsLTMzMjQ1NTM2M119
-->