#### Déploiement automatisé sur des nodes Debian10 et Cent-os:

- **ansible.cfg**: contient les variables d'environnement
- **display_config.yml**: playbook pour obtenir les configurations des divers nodes
- **install-apache-cent-os.yml** : installation apache pkg httpd sur Cent-Os
- **install-apache-debian.yml** : installation apache pkg apache2 sur Debian10
- **hosts.ini** : fichier inventaire utilisé pour toutes les commandes et rôles applicables à tous les roles

#### Les roles :

- **apache-cent-os** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache sur le node Cent-OS host: cent-apache.

- **apache-debian** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache sur le node debian host: dev-apache.

Les machines utilisées sont des VM virtualisées avec **Virtualbox** dans ma machine principale

Le **node manager** est ma machine principale **Debian10 buster**

--------------------------------------------------------------------------------

#### Quelques commandes à lancer pour utiliser les playbook, les roles ou pour communiquer directement avec les nodes depuis le node manager.

##### envoyer la clé edcsa à toutes les machines du reseau du fichier hosts.ini
`ansible -i hosts.ini -m authorized_key -a 'user=zenprog state=present key="{{ lookup("file", "/home/zenprog/.ssh/id_ecdsa.pub") }}"' --user zenprog --ask-pass --become --ask-become-pass all`

##### obtenir la configuration des nodes via le playbook display_config.yml
`ansible-playbook -i hosts.ini -u zenprog display_config.yml`

##### installer apache sur cent-os
`ansible-playbook -i hosts.ini -u zenprog --become --ask-become-pass install-apache-cent-os.yml`

##### installer apache sur debian
`ansible-playbook -i hosts.ini -u zenprog --become --ask-become-pass install-apache-debian.yml`

##### installer php sur cent-os

Par defaut php 7.2 est présent et prêt pour l'installation afin de pouvoir installer php7.4 changer le module par défaut à choisir en exécutant la commande suivante :

`ansible -i hosts.ini -m raw -a "sudo dnf -y module reset php && sudo dnf -y module enable php:7.4" cent-apache --user zenprog --ask-pass`

###### Retour de la commande réussie :

    cent-apache | CHANGED | rc=0 >>
    Dernière vérification de l’expiration des métadonnées effectuée il y a 2:39:54 le mer. 28 avril 2021 04:03:07 CEST.
    Dépendances résolues.
    Rien à faire.
    Terminé !
    Dernière vérification de l’expiration des métadonnées effectuée il y a 2:39:56 le mer. 28 avril 2021 04:03:07 CEST.
    Dépendances résolues.
    ================================================================================
    Paquet            Architecture     Version             Dépôt             Taille
    ================================================================================
    Activation des flux de modules:
    nginx                              1.14                                       
    php                                7.4                                        

    Résumé de la transaction
    ================================================================================

    Terminé !
    Shared connection to cent-apache closed.
