#!/bin/bash
# Script pour le TP backup de site1
# Script post

## echo $$ > /var/run/tp1_backup/pid
if [[ $(ls -1 /home/user1/site1backup | wc -l) == 8 ]]
then
        rm "$(ls -t | tail -1)"
        echo "Supprimé le fichier le plus ancien, trop de sauvegardes" 
fi
