#### Déploiement automatisé sur des nodes Debian10 et Cent-os

- **ansible.cfg**: contient les variables d'environnement
- **command.sh**: contient des commandes directes vers les nodes
- **display_config.yml**: playbook pour obtenir les configuartions des divers nodes
- **install-apache-cent-os.yml** : installation apache pkg httpd sur Cent-Os
- **install-apache-debian.yml** : installation apache pkg apache2 sur Debian10
- **hosts.ini** : fichier inventaire utilisé pour toutes les commandes et rôles applicables à tous les roles

#### Les roles :

- **apache-cent-os** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache sur le node Cent-OS host: cent-apache.

- **apache-debian** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache sur le node debian host: dev-apache.

Les machines utilisées sont des VM virtualisées avec **Virtualbox** dans ma machine principale

Le **node manager** est ma machine principale **Debian10 buster**
