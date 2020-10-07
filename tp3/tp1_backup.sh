#!/bin/bash
# Script pour le TP backup de site1
# Modifié pour ne pas prendre d'argument

echo $$ > /var/run/tp1_backup/pid
tar -czf /home/user1/site1backup/site1_$(date +"%Y%m%d_%H%M%S").tar.gz /srv/site1
