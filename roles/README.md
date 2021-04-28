# Arborescence des roles :

Les rôles crées par la commande suivante obtiennent l'Arborescence qui suit

 `ansible-galaxy init <nom du role>`

- **files**: Contient tous les fichiers à copier sur les nodes
- **templates**: Tous les fichiers de templates Jinja
- **tasks**: liste des instructions à exécuter (le fichier main.yml est obligatoire)
- **handlers**: même chose pour les instructions handlers (le fichier main.yml est obligatoire)
- **vars**: fichier contenant les déclarations de variables (le fichier main.yml est obligatoire), les variables définies ici sont prioritaires par rapport aux variables définies dans l'inventaire
- **defaults**: valeurs par défaut (le fichier main.yml est obligatoire) avec une priorité moindre
- **meta**: dépendances du rôle et informations ( auteur, licence, plateforme.. ) sur le rôle (le fichier main.yml est obligatoire)
