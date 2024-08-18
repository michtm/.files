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

dotfiles_doit()
{
	option=$1
	shift
	case $option in
		-D)
			action="Unstowing"
			;;
		-R)
			action="Stowing"
			;;
	esac
	if [ $# -eq 0 ];
	then
		echo "[$FUNCNAME] $action all..."
		for a_dotfiles in "${dotfiles[@]}";
		do
			source_directory="${a_dotfiles%%:*}"
			target_directory="${a_dotfiles##*:}"
			echo "[$FUNCNAME]   $action $source_directory..."
			stow -v -R -t $target_directory $source_directory
		done
	else
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
				echo "[$FUNCNAME] $action $source_directory..."
				stow -v $option -t $target_directory $source_directory
			fi
		done
	fi
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
			dotfiles_doit -R $@
			break
			;;
		remove)
			shift
			dotfiles_doit -D $@
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
unset -f dotfiles_usage dotfiles_doit

exit $an_error_occurs
