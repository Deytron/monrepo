#!/bin/bash
# Script pour le TP backup de site1
# Script pre

# echo $$ > /var/run/tp1_backup/pid
if [ ! -d "/srv/site1/" ]
then
        echo "Le répertoire /srv/site1 n'existe pas !"
        exit 7
else
        mkdir -p /home/user1/site1backup
fi
