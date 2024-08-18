#!/usr/bin/env bash
# dotfiles.sh - Gestion de fichiers points

# Liste des fichiers points
dotfiles=(
	"bash:$HOME"
	"git:$HOME"
)
an_error_occurs=0

# Fonctions
dotfiles_usage()
{
	cat <<EOF
Usage: ${0##*/} <command> [<dotfiles> ...]

Liste des commandes disponibles:
        help       Affiche un message d'aide à l'utilisation
        install    Installe des fichiers points
        remove     Supprime des fichiers points

Liste des fichiers points disponibles:
$(printf '        %s\n' "${dotfiles[@]%%:*}")
EOF
}

dotfiles_install_all()
{
	echo "[$FUNCNAME] Installing all..."
	for a_dotfiles in "${dotfiles[@]}";
	do
		source_directory="${a_dotfiles%%:*}"
		target_directory="${a_dotfiles##*:}"
		echo "[$FUNCNAME] Stowing $source_directory..."
		stow -v -R -t $target_directory $source_directory
	done
}

dotfiles_install()
{
	if [ $# -eq 0 ];
	then
		dotfiles_install_all
	else
		# Parcourir chaque élément du paramètre en entrée
		# Recherche du répertoire cible dans la variable 'dotfiles'
		# Création des liens symboliques sur la cible avec 'stow'
		for a_dotfiles in $@
		do
			for template_dotfiles in "${dotfiles[@]}";
			do
				source_directory="${template_dotfiles%%:*}"
				target_directory="${template_dotfiles##*:}"
				if [ "$source_directory" == "$a_dotfiles" ];
				then
					break
				else
					target_directory=
				fi
			done
			if [ -z "$target_directory" ];
			then
				echo "[$FUNCNAME] Error: could not found target directory for '$a_dotfiles'"
			else
				echo "[$FUNCNAME] Stowing $source_directory..."
				stow -v -R -t $target_directory $source_directory
			fi
		done
	fi
}

dotfiles_remove()
{
	echo "[$FUNCNAME] Not implemented"
}

# Programme principal
while true;
do
	case "$1" in
		help|"")
			dotfiles_usage
			break
			;;

		install)
			shift
			dotfiles_install $@
			break
			;;
		remove)
			shift
			dotfiles_remove $@
			break
			;;
		*)
			echo "${0##*/}: Invalid command: $1"
			an_error_occurs=1
			break
			;;
	esac
done

unset -v dotfiles
unset -f dotfiles_usage dotfiles_install dotfiles_remove

exit $an_error_occurs
