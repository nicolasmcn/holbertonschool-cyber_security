#!/bin/bash
sudo useradd -m -s /bin/sh "$1" && echo "$1:$2" | sudo chpasswd
&& echo "Utilisateur $1 créé avec succès." && echo "Mot de passe défini pour l'utilisateur $1."
