#### Déploiement automatisé sur des nodes Debian10 et Cent-os

- **ansible.cfg**: contient les variables d'environnement
- **command.sh**: contient des commandes directes vers les nodes
- **display_config.yml**: playbook pour obtenir les configuartions des divers nodes
- **hosts.ini** : fichier utilisé pour toutes les commandes et rôles applicables à tous les nodes
- **hosts_cent_os.ini**:  fichier utilisé pour toutes les commandes et rôles applicables aux nodes cent Os
- **hosts_debian.ini**: fichier utilisé pour toutes les commandes et rôles applicables aux nodes Debian10

#### Les roles :

- **apache** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache sur les nodes concernés. 
