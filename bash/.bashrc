# ~/.bashrc - Fichier exécuté lors d'un shell de non-connexion

## Partie commune aux sessions interactives et non-interactives

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

## Partie spécifique aux shells interactives
## 1. Environnement
## 2. Couleurs
## 3. Aliases
## 4. Autocomplétion
## 5. Présentation
ssource()
{
	if [ -f $1 ]; then
		source $1
	fi
}

ssource ~/.bash_environment
ssource ~/.bash_colors
ssource ~/.bash_aliases
ssource ~/.bash_autocomplete
ssource ~/.bash_layout

unset -f ssource
