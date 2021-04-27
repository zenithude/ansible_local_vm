#!/usr/bin/bash

# envoyer la clé edcsa à toutes les machines du reseau du fichier hosts.ini

ansible -i hosts.ini -m authorized_key -a 'user=zenprog state=present key="{{ lookup("file", "/home/zenprog/.ssh/id_ecdsa.pub") }}"' --user zenprog --ask-pass --become --ask-become-pass all

# obtenir la configuration des nodes via le playbook display_config.yml

ansible-playbook -i hosts.ini -u zenprog display_config.yml

# installer apache sur cent-os
ansible-playbook -i hosts.ini -u zenprog --become --ask-become-pass install-apache-cent-os.yml

# installer apache sur debian
ansible-playbook -i hosts.ini -u zenprog --become --ask-become-pass install-apache-debian.yml
