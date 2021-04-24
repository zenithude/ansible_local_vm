#!/usr/bin/bash

# envoyer la clé edcsa à toutes les machines du reseau du fichier hosts.ini

ansible -i hosts.ini -m authorized_key -a 'user=zenprog state=present key="{{ lookup("file", "/home/zenprog/.ssh/id_ecdsa.pub") }}"' --user zenprog --ask-pass --become --ask-become-pass all
