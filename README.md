#### Déploiement automatisé sur des nodes Debian10 et Cent-os:

- **ansible.cfg**: contient les variables d'environnement
- **display_config.yml**: playbook pour obtenir les configurations des divers nodes
- **install-apache-cent-os.yml** : installation apache pkg httpd sur Cent-Os
- **install-apache-debian.yml** : installation apache pkg apache2 sur Debian10
- **install-mariadb-cent-os.yml** : installation mariadb-server sur Cent-Os
- **install-mariadb-debian.yml** : installation mariadb-server sur Debian10
- **hosts.ini** : fichier inventaire utilisé pour toutes les commandes et rôles applicables à tous les roles (ce fichier contient les noms ou IP des différentes machines: remplacez les noms contenus dedans par vos hostname ou IP) pour utiliser les hostname compléter le fichier /etc/hosts comme dans l'exemple ci dessous.

**fichier /etc/hosts**

    127.0.0.1	localhost
    127.0.1.1	zenithude
    192.168.0.12 	localhost zenithude

    # ######################## #
    # #   Mon reseau local   # #
    # ######################## #
    # ## VM ## #
    # dev-mysql debian VM
    192.168.0.20	dev-mysql
    # dev-apache debian VM
    192.168.0.21	dev-apache
    # dev-apache cent-os VM
    192.168.0.22	cent-apache
    # dev-mysql cent-os VM
    192.168.0.23	cent-mysql
    # ######################## #
    # #   Fin reseau local   # #
    # ######################## #

    # The following lines are desirable for IPv6 capable hosts
    ::1     localhost ip6-localhost ip6-loopback
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters


#### Les roles :

- **apache-cent-os** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache et de php7 et ses modules sur le node Cent-OS host: cent-apache.

- **apache-debian** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur apache etde php7 et ses modules sur le node debian host: dev-apache.

- **mariadb-cent-os** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur mysql sur le node Cent-OS host: cent-apache.

- **mariadb-debian** : contient tous les fichiers nécessaires au Déploiement et à la configuration d'un serveur mysql sur le node debian host: dev-apache.

Les machines utilisées sont des VM virtualisées avec **Virtualbox** dans ma machine principale

Le **node manager** est ma machine principale **Debian10 buster**

--------------------------------------------------------------------------------

#### Quelques commandes à lancer pour utiliser les playbook, les roles ou pour communiquer directement avec les nodes depuis le node manager.

> Dans toutes les commandes remplacez **'your user'** par l'utilisateur de la machine distante et/ou virtuelle

##### envoyer la clé edcsa à toutes les machines du reseau du fichier hosts.ini
`ansible -i hosts.ini -m authorized_key -a 'user='your user' state=present key="{{ lookup("file", "/home/'your user'/.ssh/id_ecdsa.pub") }}"' --user 'your user' --ask-pass --become --ask-become-pass all`

##### obtenir la configuration des nodes via le playbook display_config.yml
`ansible-playbook -i hosts.ini -u 'your user' display_config.yml`

##### installer php sur cent-os

Par defaut php 7.2 est présent et prêt pour l'installation afin de pouvoir installer php7.4 changer le module par défaut à choisir en exécutant la commande suivante :

`ansible -i hosts.ini -m raw -a "sudo dnf -y module reset php && sudo dnf -y module enable php:7.4" cent-apache --user 'your user' --ask-pass`

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


##### installer apache et php sur cent-os

`ansible-playbook -i hosts.ini -u 'your user' --become --ask-become-pass install-apache-cent-os.yml`

##### installer apache et php sur debian

`ansible-playbook -i hosts.ini -u 'your user' --become --ask-become-pass install-apache-debian.yml`
