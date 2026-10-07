# Historique Bash.

# Ignore les doublons consécutifs et les commandes commençant par une espace.
HISTCONTROL=ignoreboth

# Ajoute les nouvelles commandes au fichier au lieu de l'écraser.
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000
