# Comportement général du shell.

# Met à jour LINES et COLUMNS après chaque commande si nécessaire.
shopt -s checkwinsize

# Configure less pour certains contenus non textuels.
if [[ -x /usr/bin/lesspipe ]]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi
